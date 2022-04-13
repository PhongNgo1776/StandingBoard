import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/view_models/GameProvider.dart';

import 'MatchInfos.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final viewModel = Provider.of<GameProvider>(context, listen: false);
    viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sh, horizontal: 0.1.sw),
              child: Row(
                children: [
                  Image.asset(
                    'images/match_icon.png',
                    width: 100.r,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'TRD UNDERDOGS - Kings and Queens Cup 2022',
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 0.5.sw,
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
                                child: Column(
                                  children: [
                                    Text(
                                      'Round',
                                      textAlign: TextAlign.left,
                                      style: titleTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
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
                        Container(
                          width: 0.1.sw,
                          alignment: Alignment.center,
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
                        Container(
                          alignment: Alignment.center,
                          width: 0.2.sw,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(TITLE_BG_COLOR),
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Text(
                            'Tournament framework',
                            style: titleTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SingleChildScrollView(child: MatchInfos())),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              color: Color(0xFF202020),
              child: RichText(
                text: TextSpan(
                    text: 'TRD Underdogs -  Hockey for folket av folket',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.small,
                    ),
                    children: [
                      TextSpan(
                        text: ' - del av NIHF Livslang idrett',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle titleTextStyle = GoogleFonts.anton(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: FontSize.medium,
    ),
  );
}
