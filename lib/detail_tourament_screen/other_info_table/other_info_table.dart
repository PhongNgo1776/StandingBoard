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
                title: gameProvider.tournamentFramework.timeBetweenMatchesName,
                value: gameProvider.tournamentFramework.timeBetweenMatchesValue
                        .toString() +
                    ' mins',
              ),
              TitleValueItem(
                title: gameProvider.tournamentFramework.matchDurationName,
                value: gameProvider.tournamentFramework.matchDurationValue
                        .toString() +
                    ' mins',
              ),
              TitleValueItem(
                title: gameProvider.tournamentFramework.breakDurationName,
                value: gameProvider.tournamentFramework.breakDurationValue
                        .toString() +
                    ' mins',
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
                title: gameProvider.pointInfo.winTitle,
                value: gameProvider.pointInfo.winValue.toString() + ' points',
              ),
              TitleValueItem(
                title: gameProvider.pointInfo.drawTitle,
                value: gameProvider.pointInfo.drawValue.toString() + ' points',
              ),
              TitleValueItem(
                title: gameProvider.pointInfo.lossTitle,
                value: gameProvider.pointInfo.lossValue.toString() + ' points',
              ),
            ],
          ),
        ),
        OtherInfoHeader(title: 'Standings'),
        OtherInfoBodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              gameProvider.standings.length,
              (index) => TitleValueItem(
                title: gameProvider.standings[index].team,
                value: gameProvider.standings[index].point.toString(),
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
                title: gameProvider.winner,
                value: gameProvider.winnerPoint,
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 20.h : 0)
      ],
    );
  }
}
