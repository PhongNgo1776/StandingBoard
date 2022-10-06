import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/view_models/time_provider.dart';

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
        MatchInfo(schedule: firstSchedule),
        if (secondSchedule != null) MatchInfo(schedule: secondSchedule ?? ''),
      ],
    );
  }
}

class MatchInfo extends StatelessWidget {
  const MatchInfo({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final String schedule;

  @override
  Widget build(BuildContext context) {
    var timeProvider = Provider.of<TimeProvider>(context);
    var isPlaying = timeProvider.isPlaying(schedule);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 3.5.h),
      decoration: BoxDecoration(
        color: isPlaying ? GRAY_BG_COLOR : Colors.transparent,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: isPlaying
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isPlaying,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              margin: EdgeInsets.only(left: 10.w, right: 25.w),
              padding: EdgeInsets.symmetric(vertical: 1.2.h),
              child: Image.asset(
                'images/left_arrow.png',
                width: 15.w,
                color: Colors.black,
              ),
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
              decoration: BoxDecoration(
                color: titelBgColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.w),
                  bottomRight: Radius.circular(5.w),
                ),
              ),
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
