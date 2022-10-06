import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gsheets/gsheets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:standingboard/models/match.dart';
import 'package:standingboard/models/point_info.dart';
import 'package:standingboard/models/round.dart';
import 'package:standingboard/models/setting.dart';
import 'package:standingboard/models/standing.dart';
import 'package:standingboard/models/tournament_framework.dart';
import 'package:standingboard/utils/constants.dart';

const gsDateBase = 2209161600 / 86400;
const gsDateFactor = 86400000;

String timeFromGsheets(String value) {
  final date = double.parse(value);
  final millis = (date - gsDateBase) * gsDateFactor;
  final dateTime =
      DateTime.fromMillisecondsSinceEpoch(millis.round(), isUtc: true);
  return Jiffy(dateTime).Hm;
}

class GoogleSheetProvider extends ChangeNotifier {
  final gsheets = GSheets(credential);
  TournamentFramework? _tournamentFramework;
  PointInfo? _pointInfo;
  TournamentFramework get tournamentFramework => _tournamentFramework!;
  PointInfo get pointInfo => _pointInfo!;
  List<Round> _rounds = <Round>[];
  List<Round> get rounds => _rounds;
  List<Standing> _standings = <Standing>[];
  List<Standing> get standings => _standings;
  Setting? _setting;
  Setting? get setting => _setting;
  String? _winner;
  String get winner => _winner!;

  late List<List<String>> _dataRows;
  bool loadedData = false;

  late Worksheet _sheet;
  late Spreadsheet _spreadsheet;
  Timer? timer;

  Future<String> init() async {
    _spreadsheet = await gsheets.spreadsheet(spreedsheetId);
    _sheet = _spreadsheet.worksheetByTitle('Cup 1')!;

    try {
      await _fetchData();
    } catch (e) {
    } finally {
      timer?.cancel();
      timer = Timer.periodic(
          Duration(seconds: _setting?.intervalReloading ?? 10),
          (_) => _fetchData());
    }
    return 'ok';
  }

  Future<void> _fetchData() async {
    print('----------FETCHING DATA');
    _dataRows =
        await _sheet.values.allRows(fromRow: 4, fromColumn: 2, length: 22);

    _readSetting();
    _readTournamentFramework();
    _readPointsInfo();
    _readStandings();
    _readMatches();
    _readWinner();

    print('----------DONE DATA');
    notifyListeners();
  }

  void _readTournamentFramework() {
    const int fromColumnIndex = 12;
    final timeBetweenMatchesName = _dataRows[0][fromColumnIndex];
    var timeBetweenMatchesValue =
        timeFromGsheets(_dataRows[0][fromColumnIndex + 1]);
    final matchDurationName = _dataRows[1][fromColumnIndex];
    final matchDurationValue =
        timeFromGsheets(_dataRows[1][fromColumnIndex + 1]);
    final breakDurationName = _dataRows[2][fromColumnIndex];
    final breakDurationValue =
        timeFromGsheets(_dataRows[2][fromColumnIndex + 1]);

    _tournamentFramework = TournamentFramework(
      timeBetweenMatchesName: timeBetweenMatchesName,
      timeBetweenMatchesValue: timeBetweenMatchesValue,
      matchDurationName: matchDurationName,
      matchDurationValue: matchDurationValue,
      breakDurationName: breakDurationName,
      breakDurationValue: breakDurationValue,
    );
    _tournamentFramework!.printDebug();
  }

  void _readPointsInfo() {
    const fromColumnIndex = 12;
    const rowIndex = 5;
    final winTitle = _dataRows[rowIndex][fromColumnIndex];

    final winValue = _dataRows[rowIndex][fromColumnIndex + 1];
    final drawTitle = _dataRows[rowIndex + 1][fromColumnIndex];
    final drawValue = _dataRows[rowIndex + 1][fromColumnIndex + 1];
    final lossTitle = _dataRows[rowIndex + 2][fromColumnIndex];
    final lossValue = _dataRows[rowIndex + 2][fromColumnIndex + 1];

    _pointInfo = PointInfo(
        winTitle: winTitle,
        winValue: winValue,
        drawTitle: drawTitle,
        drawValue: drawValue,
        lossTitle: lossTitle,
        lossValue: lossValue);
    _pointInfo!.printDebug();
  }

  Future<void> _readWinner() async {
    if (_dataRows[0].length >= 14) {
      _winner = _dataRows[0][14];
    }
  }

  Future<void> _readSetting() async {
    var settingColumnIndex = 20;
    _setting = Setting(
        header: _dataRows[0][settingColumnIndex],
        footer: _dataRows[1][settingColumnIndex],
        alternativeFooter: _dataRows[2][settingColumnIndex],
        logoURL: _dataRows[3][settingColumnIndex],
        intervalReloading:
            int.tryParse(_dataRows[4][settingColumnIndex]) ?? 10);
  }

  void _readStandings() {
    const fromIndex = 12;
    const rowIdex = 11;
    _standings = <Standing>[];
    for (int i = rowIdex; i < _dataRows.length; i++) {
      var dataRow = _dataRows[i];
      if (dataRow.length < 13) continue;
      var team = dataRow[fromIndex];
      var point = dataRow[fromIndex + 1];
      _standings.add(Standing(team: team, point: int.tryParse(point)!));
    }

    _standings.forEach((element) => element.debugLog());
  }

  Future<void> _readMatches() async {
    _rounds = <Round>[];
    _dataRows.forEach((dataRow) {
      if (dataRow.isNotEmpty && dataRow[1].isNotEmpty) {
        print(dataRow);
        var newMatch = Match(
            team1: dataRow[1],
            team2: dataRow[3],
            schedule:
                '${timeFromGsheets(dataRow[5])} - ${timeFromGsheets(dataRow[6])}',
            result: MatchResult(
                team1Goals: dataRow[8] != "" ? dataRow[8] : "0",
                team2Goals: dataRow[10] != "" ? dataRow[10] : "0"));
        var roundNumber = int.tryParse(dataRow[0]);
        if (roundNumber == null && _rounds.isNotEmpty) {
          roundNumber = _rounds.last.roundNumber;
        }
        var existedRound = _rounds.isNotEmpty
            ? _rounds.any((element) => element.roundNumber == roundNumber!)
            : false;
        Round addedRound;
        if (existedRound) {
          addedRound = _rounds
              .firstWhere((element) => element.roundNumber == roundNumber!);
          addedRound.matches.add(newMatch);
        } else {
          addedRound = Round(roundNumber: roundNumber!, matches: [newMatch]);
          _rounds.add(addedRound);
        }
      }
    });

    _rounds.forEach((round) => round.debugLog());
  }

  // Future<void> _fetchSetting() async {
  //   final sheet = _spreadsheet.worksheetByTitle('Setting')!;
  //   final dataRows = await sheet.values.allRows(length: 2);
  //   _setting = Setting(
  //       header: dataRows[0][1],
  //       footer: dataRows[1][1],
  //       alternativeFooter: dataRows[2][1],
  //       logoURL: dataRows[3][1],
  //       intervalReloading: int.tryParse(dataRows[4][1]) ?? 10);
  // }

  String get winnerPoint => standings
      .firstWhere((element) => element.team == winner)
      .point
      .toString();
}
