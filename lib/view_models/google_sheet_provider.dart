import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gsheets/gsheets.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:standingboard/models/match.dart';
import 'package:standingboard/models/point_info.dart';
import 'package:standingboard/models/round.dart';
import 'package:standingboard/models/setting.dart';
import 'package:standingboard/models/standing.dart';
import 'package:standingboard/models/tournament_framework.dart';

const _credential = r'''
{
  "type": "service_account",
  "project_id": "hockey-standings-board",
  "private_key_id": "fea6817d7b17c74049d683d13f1a12dad2396360",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDLVSw7GXGZzQSM\nceuJhfNzHno9T8/une2syEqiwR2AEnc6btIC7jm1aBjViOD33tM3MngyrHTP5+zL\nUnNOKT0OrMKvehD81YwoC9jDGOm8eZPlcZLAQ8pcvXiHgN4YDLiKYaqUH9Qzb4b4\nEs1KLHa8EGZLRJCTaqtG0C1Ok7eYOBSDeM9ltGjulIj5fEcIc8S3K0wWkIuE/O77\nrUDnFXQ1qiRgxPG3fOncednmbl4Uv7uGJQnJsi1Tn1Qmo27LPvt442b0moE2b+Qi\nmVdJwxhOmpy5ZLnQ5LcVlYb8FI5VFFg+TQMym2C96btl8TiaaMMW5yGsLAQKpN90\nic4OFSFbAgMBAAECggEADr8ZmxuoSoA88Tad33ZwhovST7oHGYYoo5xPFWiuDAjK\nztkUsBO46bgn/OyVbESjyuAFKZ+qRR3L5Z8QL7376KGM6Q8QRlXyeUEKsnOPGBU1\nLbHD89+2wG0ZXbJx6QqbI6Ybqex5BlXzUvCCJPv+jHsgABtz5M0aqOMWNhmuegKN\n8/3wQ0UMChhSd5WgbtGWsJmmdpwZRp0FaCuBIAHBCwXr6/hgrx3DoOqgWTZ2HIba\nuMbMOzA+zXNx0ad3EAn3N3FhMp0xDEhf2mjoJxpjYMTmYrk9NhYppoOoDZP/G1LI\npXdE3E6OYRp/ZJd2du0MD9uSFeoO83bErApdKXFD6QKBgQD67zdWmwIa/R+sXbxH\n8ETnCuH4OeuxS1bzSETILuv3gkNGaXRevL9Mgr9lLps31ZyJfPgHNsdg5BsG8gNT\nQZfI9RN91fC8JSKEh3GO+OEZ9RrhlUKOhwOR7lRM/o26sHuqf0wbypLzyUn7lp79\n4CqLi9SdFlcL9lN9Lvftt7iE1wKBgQDPb/WfSn3GC4FvVHy5No8yAjrV6+j+Dt3x\ngsbR1NKNoAONBOzlhXY1hjQc7wrS7LuAC8l5m1j/gw4QEX4wyRl527wOLSF3bcIi\n3ODfGTcs4HV9OLp9n8RlzbjESsKhDO42Ddw1CuKh3Xh1QwWVI4Nf8aSXW0cNpj3h\nBC5Ur9rzHQKBgFF9jCgY8McY+sc8LZ/jHE030IiPLsaF4/ffuU6VRlY7vGNKbdsy\nSqGrOELArvGj8lEH/3hARuFlUo2f3IqWG5fMVwcfii1fleUaIzu+AUQvwAoQMewd\nVoB2uHPEmvxMwextqKbB05VOAjOtB3cE7Gwi/eoBzkT5OsXFkghmCItDAoGADmeg\n7+HVYBZWc6uzSY1PXlKnUUmjkVjo8qd5NQMJaApPlNBdvwaIkejy33t+De2gi6DF\n6eruwDeSl20PjUW5viuTIIzjwQ5fJ9qcxwFSQoyHvB1fXe/lTIh/pynl4Bcsx5Yo\nz4ok+MaPYd04mwWvTs9R9azB/2Gm9GQ872aS1sUCgYAU/r35ub0HHH34+auHD6ey\nZqlukd2kqNhEJdMEefDTgSfPfce5yrAfHWLd/lnCECKTKR+31IPIdF+hu/a1L/4F\nGmAwKLnNJphiadXC+og73jirbnYDO5mot2bIEjb93CX5tdQCgv055kuce/3myoLK\n4b33U6vG37ZOyd54j9ezUQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "hockey-standings-board@hockey-standings-board.iam.gserviceaccount.com",
  "client_id": "118022966510050812105",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hockey-standings-board%40hockey-standings-board.iam.gserviceaccount.com"
}
''';
const _spreedsheetId = '1xXAER0gElJ2Cety-_91hYtEtLZLoORXmkD-3in3NMYU';

const gsDateBase = 2209161600 / 86400;
const gsDateFactor = 86400000;

String timeFromGsheets(String value) {
  final date = double.parse(value);
  final millis = (date - gsDateBase) * gsDateFactor;
  final dateTime =
      DateTime.fromMillisecondsSinceEpoch(millis.round(), isUtc: true);
  // return Jiffy(dateTime).Hm;
  return '10:10';
}

class GoogleSheetProvider extends ChangeNotifier {
  final gsheets = GSheets(_credential);
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
    _spreadsheet = await gsheets.spreadsheet(_spreedsheetId);
    _sheet = _spreadsheet.worksheetByTitle('Tournament')!;

    try {
      await _fetchSetting();
      await _fetchTournamentData();
    } catch (e) {
    } finally {
      timer?.cancel();
      timer = Timer.periodic(
          Duration(seconds: _setting?.intervalReloading ?? 10),
          (_) => _fetchTournamentData());
    }
    return 'ok';
  }

  Future<void> _fetchTournamentData() async {
    print('----------FETCHING TOURNAMENT DATA');
    _dataRows =
        await _sheet.values.allRows(fromRow: 4, fromColumn: 2, length: 15);

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

  Future<void> _fetchSetting() async {
    final sheet = _spreadsheet.worksheetByTitle('Setting')!;
    final dataRows = await sheet.values.allRows(length: 2);
    _setting = Setting(
        header: dataRows[0][1],
        footer: dataRows[1][1],
        alternativeFooter: dataRows[2][1],
        logoURL: dataRows[3][1],
        intervalReloading: int.tryParse(dataRows[4][1]) ?? 10);
  }
}
