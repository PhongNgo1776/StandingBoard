import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../view_models/google_sheet_provider.dart';

class TeamRankingRound extends StatelessWidget {
  const TeamRankingRound({
    Key? key,
    required this.cupName,
  }) : super(key: key);

  final String cupName;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.01.sw),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.setCurrentCup(cupName);
                Navigator.pushNamed(context, '/detail', arguments: cupName);
              },
              child: Ink(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: titelBgColor,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Text(
                  cupName,
                  textAlign: TextAlign.center,
                  style: titleTextStyle,
                ),
              ),
            ),
            ...provider.cupMap[cupName]?.standings
                    .map(
                      (e) => PointTeam(
                        teamName: e.team,
                        points: e.point,
                      ),
                    )
                    .toList() ??
                [SizedBox()],
          ],
        ),
      ),
    );
  }
}

class PointTeam extends StatelessWidget {
  const PointTeam({
    Key? key,
    required this.teamName,
    required this.points,
  }) : super(key: key);

  final String? teamName;
  final int? points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.025.sw,
        vertical: 0.01.sh,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            teamName ?? '',
            textAlign: TextAlign.left,
            style: titleTextStyle,
          ),
          Text(
            points == null ? '' : points.toString(),
            textAlign: TextAlign.right,
            style: titleTextStyle,
          ),
        ],
      ),
    );
  }
}
