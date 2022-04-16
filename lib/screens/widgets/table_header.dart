import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/screens/widgets/other_info_header.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/utils.dart';

class TableHeader extends StatelessWidget {
  TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: MatchGroupHeader(
            titleTextStyle: titleTextStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: OtherInfoHeader(
            title: 'Tournament framework',
          ),
        ),
      ],
    );
  }
}

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
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: Color(TITLE_BG_COLOR),
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Round',
                    textAlign: TextAlign.left,
                    style: titleTextStyle,
                  ),
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
                    textAlign: TextAlign.right,
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
              color: Color(TITLE_BG_COLOR),
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
