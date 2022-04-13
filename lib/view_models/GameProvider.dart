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
  List<Round>? _rounds;
  List<Round> get rounds => _rounds!;
  List<Standing>? _standings;
  List<Standing> get standings => _standings!;
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

  late Worksheet _sheet;
  late Spreadsheet _spreadsheet;

  Future<String> init() async {
    _spreadsheet = await gsheets.spreadsheet(_spreedsheetId);
    _sheet = _spreadsheet.worksheetByTitle('Tournament')!;
    await _readCommonSettings(_spreadsheet);
    await refreshData();
    Timer.periodic(Duration(milliseconds: 1100), (_) => refreshData());
    return 'ok';
  }

  Future<void> refreshData() async {
    await _readTournamentFramework(_spreadsheet);
    await _readPointsInfo(_spreadsheet);
    await _readStandings(_spreadsheet);
    await _readMatches(_spreadsheet);
    await _readWinner(_spreadsheet);
    notifyListeners();
  }

  Future<void> _readTournamentFramework(Spreadsheet spreadsheet) async {
    final title = await _sheet.values.value(column: 8, row: 1);
    final timeBetweenMatchesName = await _sheet.values.value(column: 8, row: 2);
    final timeBetweenMatchesValue =
        await _sheet.values.value(column: 9, row: 2);
    final matchDurationName = await _sheet.values.value(column: 8, row: 3);
    final matchDurationValue = await _sheet.values.value(column: 9, row: 3);
    final breakDurationName = await _sheet.values.value(column: 8, row: 4);
    final breakDurationValue = await _sheet.values.value(column: 9, row: 4);

    _tournamentFramework = TournamentFramework(
      title: title,
      timeBetweenMatchesName: timeBetweenMatchesName,
      timeBetweenMatchesValue: int.tryParse(timeBetweenMatchesValue)!,
      matchDurationName: matchDurationName,
      matchDurationValue: int.tryParse(matchDurationValue)!,
      breakDurationName: breakDurationName,
      breakDurationValue: int.tryParse(breakDurationValue)!,
    );
  }

  Future<void> _readPointsInfo(Spreadsheet spreadsheet) async {
    final title = await _sheet.values.value(column: 8, row: 5);
    final winTitle = await _sheet.values.value(column: 8, row: 6);
    final winValue = await _sheet.values.value(column: 9, row: 6);
    final drawTitle = await _sheet.values.value(column: 8, row: 7);
    final drawValue = await _sheet.values.value(column: 9, row: 7);
    final lossTitle = await _sheet.values.value(column: 8, row: 8);
    final lossValue = await _sheet.values.value(column: 9, row: 8);

    _pointInfo = PointInfo(
        title: title,
        winTitle: winTitle,
        winValue: int.tryParse(winValue)!,
        drawTitle: drawTitle,
        drawValue: int.tryParse(drawValue)!,
        lossTitle: lossTitle,
        lossValue: int.tryParse(lossValue)!);
  }

  Future<void> _readWinner(Spreadsheet spreadsheet) async {
    _winner = await _sheet.values.value(column: 14, row: 2);
  }

  Future<void> _readStandings(Spreadsheet spreadsheet) async {
    var standingDatas =
        await _sheet.values.allRows(fromRow: 2, fromColumn: 12, length: 2);
    _standings = <Standing>[];
    standingDatas.forEach((data) {
      _standings!.add(Standing(team: data[0], point: int.tryParse(data[1])!));
    });

    _standings!.forEach((element) => element.debugLog());
  }

  Future<void> _readMatches(Spreadsheet spreadsheet) async {
    final roundDatas = await _sheet.values.allRows(fromRow: 2, length: 6);
    _rounds = <Round>[];
    roundDatas.forEach((round) {
      if (round.isNotEmpty) {
        var newMatch = Match(
            team1: round[1],
            team2: round[2],
            schedule: round[3],
            result: MatchResult(
                team1Goals: int.tryParse(round[4])!,
                team2Goals: int.tryParse(round[5])!));
        final roundNumber = int.tryParse(round[0]);
        var existedRound = _rounds!.isNotEmpty
            ? _rounds!.any((element) => element.roundNumber == roundNumber!)
            : false;
        Round addedRound;
        if (existedRound) {
          addedRound = _rounds!
              .firstWhere((element) => element.roundNumber == roundNumber!);
          addedRound.matches.add(newMatch);
        } else {
          addedRound = Round(roundNumber: roundNumber!, matches: [newMatch]);
          _rounds!.add(addedRound);
        }
      }
    });
    _rounds!.forEach((round) => round.debugLog());
  }

  Future<void> _readCommonSettings(Spreadsheet spreadsheet) async {
    final sheet = spreadsheet.worksheetByTitle('Setting');
    _headerText = await sheet!.values.value(column: 2, row: 1);
    _footerText = await sheet.values.value(column: 2, row: 2);
    _alternateFooterText = await sheet.values.value(column: 2, row: 3);
    _logoURL = await sheet.values.value(column: 2, row: 4);
  }
}
