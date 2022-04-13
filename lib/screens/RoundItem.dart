import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';

class RoundItem extends StatelessWidget {
  final String roundNum;
  final String leftTeamFirstRound;
  final String rightTeamFirstRound;
  final String? leftTeamSecondRound;
  final String? rightTeamSecondRound;
  final String firstSchedule;
  final String? secondSchedule;

  const RoundItem({
    Key? key,
    required this.roundNum,
    required this.leftTeamFirstRound,
    required this.rightTeamFirstRound,
    this.leftTeamSecondRound = '',
    this.rightTeamSecondRound = '',
    required this.firstSchedule,
    this.secondSchedule = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(
        left: 45.w,
        top: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(0xFF767676),
                  ),
                  child: Text(
                    roundNum,
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                            leftTeamFirstRound,
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
                            rightTeamFirstRound,
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
                  if (leftTeamSecondRound != null)
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
                              leftTeamSecondRound!,
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
                              rightTeamSecondRound!,
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstSchedule,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.anton(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.medium,
                      ),
                    ),
                  ),
                  Text(
                    secondSchedule ?? '',
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
    );
  }
}
