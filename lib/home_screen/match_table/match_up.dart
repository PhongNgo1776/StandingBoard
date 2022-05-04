import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MatchRow(
            leftTeamRound: leftTeamFirstRound,
            rightTeamRound: rightTeamFirstRound,
          ),
          SizedBox(height: 5.h),
          if (leftTeamSecondRound != null)
            MatchRow(
              leftTeamRound: leftTeamSecondRound!,
              rightTeamRound: rightTeamSecondRound!,
            ),
        ],
      ),
    );
  }
}

class MatchRow extends StatelessWidget {
  const MatchRow({
    Key? key,
    required this.leftTeamRound,
    required this.rightTeamRound,
  }) : super(key: key);

  final String leftTeamRound;
  final String rightTeamRound;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              leftTeamRound,
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
              color: TITLE_BG_COLOR,
            ),
            child: Text(
              rightTeamRound,
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
    );
  }
}
