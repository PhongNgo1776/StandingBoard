// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import '../detail_tourament_screen/footer.dart';
import '../utils/colors.dart';
import 'header.dart';
import 'team_ranking.dart';
import 'team_ranking_round.dart';

class TouramentListScreen extends StatefulWidget {
  @override
  State<TouramentListScreen> createState() => _TouramentListScreenState();
}

class _TouramentListScreenState extends State<TouramentListScreen> {
  late GoogleSheetProvider provider;
  @override
  void initState() {
    provider = Provider.of<GoogleSheetProvider>(context, listen: false);
    provider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GoogleSheetProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: provider.isLoading
            ? Center(
                child: Image.network(
                    'https://phongngo1776.github.io/StandingBoard/loading.gif'),
              )
            : InteractiveViewer(
                minScale: 1,
                maxScale: isMobile ? 2 : 1,
                child: Column(
                  children: [
                    Header(),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 0.02.sw),
                            padding: EdgeInsets.fromLTRB(50.w, 5.h, 0, 5.h),
                            decoration: BoxDecoration(
                              color: titelBgColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  provider.headerTitle,
                                  textAlign: TextAlign.left,
                                  style: titleTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.1.sw,
                              vertical: 0.05.sh,
                            ),
                            child: TeamRanking(
                              rank: 1,
                              teamName:
                                  provider.summaryPoints.entries.first.key,
                              points:
                                  provider.summaryPoints.entries.first.value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.1.sw,
                            ),
                            child: Column(children: rankings),
                          ),
                          Spacer(),
                          Row(
                            children: provider.cupMap.keys
                                .map((e) => TeamRankingRound(cupName: e))
                                .toList(),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Footer()
                  ],
                ),
              ),
      ),
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
