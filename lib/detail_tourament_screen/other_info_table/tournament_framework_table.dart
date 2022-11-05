import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/google_sheet_provider.dart';
import '../match_table/match_group_header.dart';
import 'other_info_body_container.dart';
import 'other_info_header.dart';

class TournamentFrameworkTable extends StatelessWidget {
  const TournamentFrameworkTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Column(
      children: [
        OtherInfoHeader(
          title: 'Tournament framework',
          needMarginTop: false,
        ),
        OtherInfoBodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.currentCup?.tournamentFramework
                        .timeBetweenMatchesName ??
                    '',
                value: gameProvider
                        .currentCup?.tournamentFramework.timeBetweenMatchesValue
                        .toString() ??
                    '' + ' mins',
              ),
              TitleValueItem(
                title: gameProvider
                        .currentCup?.tournamentFramework.matchDurationName ??
                    '',
                value: gameProvider
                        .currentCup?.tournamentFramework.matchDurationValue
                        .toString() ??
                    '' + ' mins',
              ),
              TitleValueItem(
                title: gameProvider
                        .currentCup?.tournamentFramework.breakDurationName ??
                    '',
                value: gameProvider
                        .currentCup?.tournamentFramework.breakDurationValue
                        .toString() ??
                    '' + ' mins',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
