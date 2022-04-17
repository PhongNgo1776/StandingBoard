import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/screens/widgets/result.dart';

import 'break_watering.dart';
import 'match_schedule.dart';
import 'mathc_up.dart';
import 'round_num.dart';

class MatchGroupItem extends StatelessWidget {
  final String roundNum;
  final String leftTeamFirstRound;
  final String rightTeamFirstRound;
  final String? leftTeamSecondRound;
  final String? rightTeamSecondRound;
  final String firstSchedule;
  final String? secondSchedule;
  final String firstResult;
  final String? secondResult;
  final bool showBreakTitle;

  const MatchGroupItem({
    Key? key,
    required this.roundNum,
    required this.leftTeamFirstRound,
    required this.rightTeamFirstRound,
    this.leftTeamSecondRound = '',
    this.rightTeamSecondRound = '',
    required this.firstSchedule,
    this.secondSchedule = '',
    required this.firstResult,
    this.secondResult,
    this.showBreakTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          if (showBreakTitle) BreakWatering(),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundNum(roundNum: roundNum),
                      Expanded(
                        flex: 6,
                        child: MatchUp(
                            leftTeamFirstRound: leftTeamFirstRound,
                            rightTeamFirstRound: rightTeamFirstRound,
                            leftTeamSecondRound: leftTeamSecondRound,
                            rightTeamSecondRound: rightTeamSecondRound),
                      ),
                      Expanded(
                        flex: 3,
                        child: MatchSchedule(
                          firstSchedule: firstSchedule,
                          secondSchedule: secondSchedule,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Result(
                  firstResult: firstResult,
                  secondResult: secondResult,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
