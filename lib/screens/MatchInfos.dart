import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

class MatchInfos extends StatelessWidget {
  const MatchInfos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 0.5.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Color(0xFF767676),
                        ),
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: FontSize.xlarge,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
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
                                'Team One',
                                style: TextStyle(
                                  fontSize: FontSize.xsmall,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                                color: Color(TITLE_BG_COLOR),
                              ),
                              child: Text(
                                ' Team Two',
                                style: TextStyle(
                                  fontSize: FontSize.xsmall,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
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
                                'Team One',
                                style: TextStyle(
                                  fontSize: FontSize.xsmall,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                                color: Color(TITLE_BG_COLOR),
                              ),
                              child: Text(
                                ' Team Two',
                                style: TextStyle(
                                  fontSize: FontSize.xsmall,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '09:00 - 09:25',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.anton(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.medium,
                            ),
                          ),
                        ),
                        Text(
                          '09:00 - 09:25',
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
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 0.1.sw,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Text(
              '0 - 0',
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
            width: 0.2.sw,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time between matches',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                    Text(
                      '5 mins',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Match duration',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                    Text(
                      '25 mins',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Break durations',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                    Text(
                      '15 mins',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.xsmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
