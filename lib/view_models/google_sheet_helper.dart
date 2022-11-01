import 'package:jiffy/jiffy.dart';

import '../models/cup.dart';
import '../models/match.dart';
import '../models/point_info.dart';
import '../models/round.dart';
import '../models/setting.dart';
import '../models/standing.dart';
import '../models/tournament_framework.dart';

const numberSecondsADay = 86400;
const gsDateBase = 2209161600 / numberSecondsADay;

String timeFromGsheets(String value) {
  final date = double.parse(value);
  final millis = (date - gsDateBase) * numberSecondsADay * 1000;
  final dateTime =
      DateTime.fromMillisecondsSinceEpoch(millis.round(), isUtc: true);
  return Jiffy(dateTime).Hm;
}

Setting readSetting(List<List<String>> _dataRows) {
  var settingColumnIndex = 20;
  return Setting(
      header: _dataRows[0][settingColumnIndex],
      footer: _dataRows[1][settingColumnIndex],
      alternativeFooter: _dataRows[2][settingColumnIndex],
      logoURL: _dataRows[3][settingColumnIndex],
      intervalReloading: int.tryParse(_dataRows[4][settingColumnIndex]) ?? 10);
}

TournamentFramework readTournamentFramework(List<List<String>> _dataRows) {
  const int fromColumnIndex = 12;
  final timeBetweenMatchesName = _dataRows[0][fromColumnIndex];
  var timeBetweenMatchesValue =
      timeFromGsheets(_dataRows[0][fromColumnIndex + 1]);
  final matchDurationName = _dataRows[1][fromColumnIndex];
  final matchDurationValue = timeFromGsheets(_dataRows[1][fromColumnIndex + 1]);
  final breakDurationName = _dataRows[2][fromColumnIndex];
  final breakDurationValue = timeFromGsheets(_dataRows[2][fromColumnIndex + 1]);

  return TournamentFramework(
    timeBetweenMatchesName: timeBetweenMatchesName,
    timeBetweenMatchesValue: timeBetweenMatchesValue,
    matchDurationName: matchDurationName,
    matchDurationValue: matchDurationValue,
    breakDurationName: breakDurationName,
    breakDurationValue: breakDurationValue,
  );
}

PointInfo readPointsInfo(List<List<String>> _dataRows) {
  const fromColumnIndex = 12;
  const rowIndex = 5;
  final winTitle = _dataRows[rowIndex][fromColumnIndex];

  final winValue = _dataRows[rowIndex][fromColumnIndex + 1];
  final drawTitle = _dataRows[rowIndex + 1][fromColumnIndex];
  final drawValue = _dataRows[rowIndex + 1][fromColumnIndex + 1];
  final lossTitle = _dataRows[rowIndex + 2][fromColumnIndex];
  final lossValue = _dataRows[rowIndex + 2][fromColumnIndex + 1];

  return PointInfo(
      winTitle: winTitle,
      winValue: winValue,
      drawTitle: drawTitle,
      drawValue: drawValue,
      lossTitle: lossTitle,
      lossValue: lossValue);
}

String readWinner(List<List<String>> _dataRows) {
  if (_dataRows[0].length >= 14) {
    return _dataRows[0][14];
  }
  return '';
}

List<Standing> readStandings(List<List<String>> _dataRows) {
  const fromIndex = 12;
  const rowIdex = 11;
  List<Standing> _standings = <Standing>[];
  for (int i = rowIdex; i < _dataRows.length; i++) {
    var dataRow = _dataRows[i];
    if (dataRow.length < 13) continue;
    var team = dataRow[fromIndex];
    var point = dataRow[fromIndex + 1];
    _standings.add(Standing(team: team, point: int.tryParse(point)!));
  }

  return _standings;
}

List<Round> readRounds(List<List<String>> _dataRows) {
  List<Round> _rounds = <Round>[];
  _dataRows.forEach((dataRow) {
    if (dataRow.isNotEmpty && dataRow[1].isNotEmpty) {
      print(dataRow);
      var newMatch = Match(
          team1: dataRow[1],
          team2: dataRow[3],
          schedule:
              '${timeFromGsheets(dataRow[5])} - ${timeFromGsheets(dataRow[6])}',
          result: MatchResult(
              team1Goals:
                  (dataRow.length > 8 && dataRow[8] != "") ? dataRow[8] : "",
              team2Goals: (dataRow.length > 10 && dataRow[10] != "")
                  ? dataRow[10]
                  : ""));
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

  return _rounds;
}

bool isNotYetStarted(Cup? cup) {
  return cup?.rounds.first.matches.first.result.team1Goals?.isEmpty ?? true;
}

int totalPlayedCups(Map<String, Cup?> cupMap) {
  return cupMap.values
      .map((cup) => isNotYetStarted(cup) ? 1 : 0)
      .reduce((value, element) => value + element);
}
