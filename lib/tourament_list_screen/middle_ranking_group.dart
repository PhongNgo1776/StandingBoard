import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/tourament_list_screen/team_ranking.dart';

import '../view_models/google_sheet_provider.dart';

class MiddleRankingGroup extends StatelessWidget {
  const MiddleRankingGroup({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final GoogleSheetProvider provider;

  @override
  Widget build(BuildContext context) {
    var firstTeam = provider.summaryPoints.entries.first;
    return firstTeam.value == 0
        ? Spacer()
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.1.sw,
                  vertical: 0.02.sh,
                ),
                child: TeamRanking(
                  rank: 1,
                  teamName: firstTeam.key,
                  points: firstTeam.value,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.1.sw,
                ),
                child: Column(children: rankings),
              ),
            ],
          );
  }

  List<Widget> get rankings {
    var rankings = <TeamRanking>[];
    var entries = provider.summaryPoints.entries.toList();
    for (var i = 1; i < entries.length; i++) {
      rankings.add(
        TeamRanking(
          rank: i + 1,
          teamName: entries[i].key,
          points: entries[i].value,
        ),
      );
    }

    return rankings;
  }
}
