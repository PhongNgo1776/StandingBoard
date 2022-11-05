import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import 'other_info_body_container.dart';
import 'other_info_header.dart';
import 'point_table.dart';
import 'title_value_item.dart';
import 'tournament_framework_table.dart';

class OtherInfoTable extends StatelessWidget {
  const OtherInfoTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Column(
      children: [
        if (!isMobile) TournamentFrameworkTable(),
        if (!isMobile) PointTable(),
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
