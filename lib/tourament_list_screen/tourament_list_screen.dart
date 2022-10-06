// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import '../utils/colors.dart';
import 'footer.dart';
import 'header.dart';
import 'team_ranking.dart';
import 'team_ranking_round.dart';

class TouramentListScreen extends StatefulWidget {
  @override
  State<TouramentListScreen> createState() => _TouramentListScreenState();
}

class _TouramentListScreenState extends State<TouramentListScreen> {
  @override
  void initState() {
    Provider.of<GoogleSheetProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GoogleSheetProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: InteractiveViewer(
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
                            'The Undedogs league 2022/23 standings',
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
                      child: TeamRanking(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.1.sw,
                      ),
                      child: Column(
                        children: [
                          TeamRanking(),
                          TeamRanking(),
                          TeamRanking(),
                          TeamRanking(),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.1.sh),
                    Row(
                      children: [
                        TeamRankingRound(),
                        TeamRankingRound(),
                        TeamRankingRound(),
                        TeamRankingRound(),
                      ],
                    ),
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
}
