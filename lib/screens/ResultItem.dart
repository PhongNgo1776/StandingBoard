import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({
    Key? key,
    required this.firstResult,
    required this.secondResult,
  }) : super(key: key);

  final String firstResult;
  final String? secondResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.1.sw,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
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
    );
  }
}
