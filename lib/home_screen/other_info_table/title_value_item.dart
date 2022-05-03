import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
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
      ),
    );
  }
}
