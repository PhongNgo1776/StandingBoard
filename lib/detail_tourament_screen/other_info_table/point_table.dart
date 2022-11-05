import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/google_sheet_provider.dart';
import '../match_table/match_group_header.dart';
import 'other_info_body_container.dart';
import 'other_info_header.dart';

class PointTable extends StatelessWidget {
  const PointTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Column(
      children: [
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
      ],
    );
  }
}
