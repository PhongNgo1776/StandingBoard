import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gsheets/gsheets.dart';
import 'package:standingboard/utils/constants.dart';

import '../models/cup.dart';
import 'google_sheet_helper.dart';

class GoogleSheetProvider extends ChangeNotifier {
  final gsheets = GSheets(credential);

  late List<List<String>> _dataRows;
  Map<String, Cup?> cupMap = {};
  Cup? currentCup;

  late Worksheet _sheet;
  late Spreadsheet _spreadsheet;
  Timer? timer;
  bool isLoading = true;
  String mainTitle = '';
  String subTitle = '';
  String headerTitle = '';
  String? summaryLogo;

  Future<String> init() async {
    _spreadsheet = await gsheets.spreadsheet(spreedsheetId);

    Worksheet _cupNameSheet = _spreadsheet.sheets.first;
    List<List<String>> _cupNameSheetDataRow = await _cupNameSheet.values
        .allRows(fromRow: 1, fromColumn: 1, length: 22);

    mainTitle = _cupNameSheetDataRow.first[3];
    subTitle = _cupNameSheetDataRow[1][3];
    summaryLogo = _cupNameSheetDataRow[2][3];
    headerTitle = _cupNameSheetDataRow[3][3];

    var _cupNameList = [];
    for (var i = 1; i < _cupNameSheetDataRow.length; i++) {
      _cupNameList.add(_cupNameSheetDataRow[i].first);
    }

    cupMap = {for (var v in _cupNameList) v: null};

    try {
      await _fetchAllCups();
    } finally {
      isLoading = false;
      timer?.cancel();
      var intervalReloading =
          cupMap.entries.first.value?.setting?.intervalReloading ?? 10;
      timer = Timer.periodic(
          Duration(seconds: intervalReloading), (_) => _fetchAllCups());
    }
    return 'ok';
  }

  Future<void> _fetchAllCups() async {
    await Future.wait(cupMap.keys.map((e) => _fetchCup(e)).toList());
    notifyListeners();
  }

  Future<void> _fetchCup(String cupName) async {
    _sheet = _spreadsheet.worksheetByTitle(cupName)!;
    print('----------FETCHING DATA');
    _dataRows =
        await _sheet.values.allRows(fromRow: 4, fromColumn: 2, length: 22);

    cupMap[cupName] = Cup(
      setting: readSetting(_dataRows),
      tournamentFramework: readTournamentFramework(_dataRows),
      pointInfo: readPointsInfo(_dataRows),
      standings: readStandings(_dataRows),
      rounds: readRounds(_dataRows),
      winner: readWinner(_dataRows),
    );

    notifyListeners();
  }

  void setCurrentCup(String cupName) {
    currentCup = cupMap[cupName];
  }

  Map<String, int?> get summaryPoints {
    Map<String, int> summaryMap = {};
    cupMap.entries.forEach((entry) {
      entry.value?.standings.forEach((standing) {
        summaryMap[standing.team] ??= 0;
        summaryMap[standing.team] = summaryMap[standing.team]! + standing.point;
      });
    });

    var sortedKeys = summaryMap.keys.toList(growable: false)
      ..sort((k1, k2) => summaryMap[k2]!.compareTo(summaryMap[k1]!));
    var sortedMap = {for (var v in sortedKeys) v: summaryMap[v]};
    return sortedMap;
  }
}
