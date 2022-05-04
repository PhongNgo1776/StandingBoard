import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

class MatchGroupHeader extends StatelessWidget {
  const MatchGroupHeader({
    Key? key,
    required this.titleTextStyle,
  }) : super(key: key);

  final TextStyle titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.fromLTRB(50.w, 5.h, 0, 5.h),
            decoration: BoxDecoration(
              color: TITLE_BG_COLOR,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Round',
                  textAlign: TextAlign.left,
                  style: titleTextStyle,
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Match up',
                    textAlign: TextAlign.center,
                    style: titleTextStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Match Schedules',
                    textAlign: TextAlign.center,
                    style: titleTextStyle,
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
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: TITLE_BG_COLOR,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Text(
              'Result',
              style: titleTextStyle,
            ),
          ),
        )
      ],
    );
  }
}

class TitleValueItem extends StatelessWidget {
  const TitleValueItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.francoisOne(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.small,
            ),
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: GoogleFonts.francoisOne(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.small,
            ),
          ),
        ),
      ],
    );
  }
}
