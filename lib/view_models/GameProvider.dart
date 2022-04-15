import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gsheets/gsheets.dart';
import 'package:standingboard/models/match.dart';
import 'package:standingboard/models/point_info.dart';
import 'package:standingboard/models/round.dart';
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
const _spreedsheetId = '1PvwYBjGDINhwEKDE0Pm-6vHiAnMuHdSaMbORcD6cYlM';

class GameProvider extends ChangeNotifier {
  final gsheets = GSheets(_credential);
  TournamentFramework? _tournamentFramework;
  PointInfo? _pointInfo;
  TournamentFramework get tournamentFramework => _tournamentFramework!;
  PointInfo get pointInfo => _pointInfo!;
  List<Round> _rounds = <Round>[];
  List<Round> get rounds => _rounds;
  List<Standing> _standings = <Standing>[];
  List<Standing> get standings => _standings;
  String? _headerText;
  String get headerText => _headerText!;
  String? _footerText;
  String get footerText => _footerText!;
  String? _alternateFooterText;
  String get alternateFooterText => _alternateFooterText!;
  String? _logoURL;
  String get logoURL => _logoURL!;
  String? _winner;
  String get winner => _winner!;

  late List<List<String>> _dataRows;
  bool loadedData = false;

  late Worksheet _sheet;
  late Spreadsheet _spreadsheet;

  Future<String> init() async {
    _spreadsheet = await gsheets.spreadsheet(_spreedsheetId);
    _sheet = _spreadsheet.worksheetByTitle('Tournament')!;

    try {
      await fetchNewData();
    } catch (e) {
    } finally {
      Timer.periodic(Duration(minutes: 1), (_) => fetchNewData());
    }
    return 'ok';
  }

  Future<void> fetchNewData() async {
    print('----------REFRESH DATA');
    _dataRows = await _sheet.values.allRows(fromRow: 2, length: 14);
    _readCommonSettings();
    _readTournamentFramework();
    _readPointsInfo();
    _readStandings();
    _readMatches();
    _readWinner();
    notifyListeners();
  }

  void _readTournamentFramework() {
    const int fromIndex = 7;

    final timeBetweenMatchesName = _dataRows[0][fromIndex];
    final timeBetweenMatchesValue = _dataRows[0][fromIndex + 1];
    final matchDurationName = _dataRows[1][fromIndex];
    final matchDurationValue = _dataRows[1][fromIndex + 1];
    final breakDurationName = _dataRows[2][fromIndex];
    final breakDurationValue = _dataRows[2][fromIndex + 1];

    _tournamentFramework = TournamentFramework(
      timeBetweenMatchesName: timeBetweenMatchesName,
      timeBetweenMatchesValue: int.tryParse(timeBetweenMatchesValue)!,
      matchDurationName: matchDurationName,
      matchDurationValue: int.tryParse(matchDurationValue)!,
      breakDurationName: breakDurationName,
      breakDurationValue: int.tryParse(breakDurationValue)!,
    );
    _tournamentFramework!.printDebug();
  }

  void _readPointsInfo() {
    const fromIndex = 7;
    const rowIndex = 3;
    final winTitle = _dataRows[rowIndex + 1][fromIndex];

    final winValue = _dataRows[rowIndex + 1][fromIndex + 1];
    final drawTitle = _dataRows[rowIndex + 2][fromIndex];
    final drawValue = _dataRows[rowIndex + 2][fromIndex + 1];
    final lossTitle = _dataRows[rowIndex + 3][fromIndex];
    final lossValue = _dataRows[rowIndex + 3][fromIndex + 1];

    _pointInfo = PointInfo(
        winTitle: winTitle,
        winValue: int.tryParse(winValue)!,
        drawTitle: drawTitle,
        drawValue: int.tryParse(drawValue)!,
        lossTitle: lossTitle,
        lossValue: int.tryParse(lossValue)!);
    _pointInfo!.printDebug();
  }

  Future<void> _readWinner() async {
    if (_dataRows[0].length >= 14) {
      _winner = _dataRows[0][13];
    }
  }

  void _readStandings() {
    const fromIndex = 11;
    const rowIdex = 1;
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
      if (dataRow.isNotEmpty && dataRow[0].isNotEmpty) {
        print(dataRow);
        var newMatch = Match(
            team1: dataRow[1],
            team2: dataRow[2],
            schedule: dataRow[3],
            result: MatchResult(
                team1Goals: int.tryParse(dataRow[4])!,
                team2Goals: int.tryParse(dataRow[5])!));
        final roundNumber = int.tryParse(dataRow[0]);
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

  void _readCommonSettings() {
    const fromIndex = 8;
    const rowIdex = 8;

    _headerText = _dataRows[rowIdex][fromIndex];
    _footerText = _dataRows[rowIdex + 1][fromIndex];
    _alternateFooterText = _dataRows[rowIdex + 2][fromIndex];
    _logoURL = _dataRows[rowIdex + 3][fromIndex];
  }
}
