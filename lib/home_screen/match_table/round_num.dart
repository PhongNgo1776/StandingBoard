import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/utils/utils.dart';

class RoundNum extends StatelessWidget {
  const RoundNum({
    Key? key,
    required this.roundNum,
    this.hasTwoMatches = true,
  }) : super(key: key);

  final String roundNum;
  final bool hasTwoMatches;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:
            hasTwoMatches ? (isMobile ? 12.h : 22.h) : (isMobile ? 3.h : 5.h),
        horizontal: isMobile ? 20.w : 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Color(0xFF767676),
      ),
      child: Text(
        roundNum,
        style: GoogleFonts.francoisOne(
          textStyle: TextStyle(
            fontSize: FontSize.xlarge,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
