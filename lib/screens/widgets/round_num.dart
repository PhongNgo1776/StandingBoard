import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';

class RoundNum extends StatelessWidget {
  const RoundNum({
    Key? key,
    required this.roundNum,
  }) : super(key: key);

  final String roundNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 10.w),
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
