import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

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
                      Expanded(
                        flex: 1,
                        child: RoundNum(roundNum: roundNum),
                      ),
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
                            secondSchedule: secondSchedule),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.03.sw),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Text(
                        firstResult,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.medium,
                          ),
                        ),
                      ),
                      Text(
                        secondResult!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MatchSchedule extends StatelessWidget {
  const MatchSchedule({
    Key? key,
    required this.firstSchedule,
    required this.secondSchedule,
  }) : super(key: key);

  final String firstSchedule;
  final String? secondSchedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            firstSchedule,
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: FontSize.medium,
              ),
            ),
          ),
          Text(
            secondSchedule ?? '',
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: FontSize.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MatchUp extends StatelessWidget {
  const MatchUp({
    Key? key,
    required this.leftTeamFirstRound,
    required this.rightTeamFirstRound,
    required this.leftTeamSecondRound,
    required this.rightTeamSecondRound,
  }) : super(key: key);

  final String leftTeamFirstRound;
  final String rightTeamFirstRound;
  final String? leftTeamSecondRound;
  final String? rightTeamSecondRound;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(0xFFC4C4C4),
                  ),
                  child: Text(
                    leftTeamFirstRound,
                    style: GoogleFonts.francoisOne(
                      textStyle: TextStyle(
                        fontSize: FontSize.small,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'VS',
                  style: TextStyle(
                    fontSize: FontSize.xsmall,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(TITLE_BG_COLOR),
                  ),
                  child: Text(
                    rightTeamFirstRound,
                    style: GoogleFonts.francoisOne(
                      textStyle: TextStyle(
                        fontSize: FontSize.small,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          if (leftTeamSecondRound != null)
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Color(0xFFC4C4C4),
                    ),
                    child: Text(
                      leftTeamSecondRound!,
                      style: GoogleFonts.francoisOne(
                        textStyle: TextStyle(
                          fontSize: FontSize.small,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      fontSize: FontSize.xsmall,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Color(TITLE_BG_COLOR),
                    ),
                    child: Text(
                      rightTeamSecondRound!,
                      style: GoogleFonts.francoisOne(
                        textStyle: TextStyle(
                          fontSize: FontSize.small,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class RoundNum extends StatelessWidget {
  const RoundNum({
    Key? key,
    required this.roundNum,
  }) : super(key: key);

  final String roundNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 7.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Color(0xFF767676),
          ),
          child: Text(
            roundNum,
            style: TextStyle(
              fontSize: FontSize.xlarge,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class BreakWatering extends StatelessWidget {
  const BreakWatering({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 55.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      'Break - Watering',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: FontSize.xsmall,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 0.03.sw),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ),
      ],
    );
  }
}
