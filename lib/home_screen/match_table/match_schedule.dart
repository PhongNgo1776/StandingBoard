import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MatchInfo(
          schedule: firstSchedule,
          isPlaying: true,
        ),
        MatchInfo(schedule: secondSchedule ?? ''),
      ],
    );
  }
}

class MatchInfo extends StatelessWidget {
  const MatchInfo({
    Key? key,
    required this.schedule,
    this.isPlaying = false,
  }) : super(key: key);

  final bool isPlaying;
  final String schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        color: isPlaying ? GRAY_BG_COLOR : Colors.transparent,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Row(
        mainAxisAlignment: isPlaying
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isPlaying,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Image.asset(
              'images/left_arrow.png',
              width: 20.w,
              color: Colors.black,
            ),
          ),
          Text(
            schedule,
            textAlign: TextAlign.center,
            style: GoogleFonts.anton(
              textStyle: TextStyle(
                color: isPlaying ? Colors.black : Colors.white,
                fontSize: FontSize.medium,
              ),
            ),
          ),
          Visibility(
            visible: isPlaying,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              color: TITLE_BG_COLOR,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'NOW',
                textAlign: TextAlign.center,
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.medium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
