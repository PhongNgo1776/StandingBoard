import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.firstResult,
    required this.secondResult,
  }) : super(key: key);

  final String firstResult;
  final String? secondResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.03.sw),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            child: Text(
              firstResult,
              textAlign: TextAlign.center,
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.medium,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.w),
            child: Text(
              secondResult!,
              textAlign: TextAlign.center,
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
