import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import 'other_info_body_container.dart';
import 'other_info_header.dart';
import 'title_value_item.dart';

class OtherInfoTable extends StatelessWidget {
  const OtherInfoTable({
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
        OtherInfoHeader(title: 'Points'),
        OtherInfoBodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.currentCup?.pointInfo.winTitle ?? '',
                value: gameProvider.currentCup?.pointInfo.winValue.toString() ??
                    '' + ' points',
              ),
              TitleValueItem(
                title: gameProvider.currentCup?.pointInfo.drawTitle ?? '',
                value:
                    gameProvider.currentCup?.pointInfo.drawValue.toString() ??
                        '' + ' points',
              ),
              TitleValueItem(
                title: gameProvider.currentCup?.pointInfo.lossTitle ?? '',
                value:
                    gameProvider.currentCup?.pointInfo.lossValue.toString() ??
                        '' + ' points',
              ),
            ],
          ),
        ),
        OtherInfoHeader(title: 'Standings'),
        OtherInfoBodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              gameProvider.currentCup?.standings.length ?? 0,
              (index) => TitleValueItem(
                title: gameProvider.currentCup?.standings[index].team ?? '',
                value: gameProvider.currentCup?.standings[index].point
                        .toString() ??
                    '',
              ),
            ),
          ),
        ),
        OtherInfoHeader(title: 'Winner 2022'),
        OtherInfoBodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.currentCup?.winner ?? '',
                value: gameProvider.currentCup?.winnerPoint ?? '',
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 20.h : 0)
      ],
    );
  }
}
