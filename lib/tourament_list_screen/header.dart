import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import '../view_models/google_sheet_helper.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 0.015.sh : 0.03.sh,
          horizontal: isMobile ? 0.05.sw : 0.1.sw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.network(
                gameProvider.summaryLogo ??
                    'https://standings.midtnorskhockeyliga.com/loading.gif',
                width: 100.r,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  gameProvider.mainTitle,
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
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text(
              gameProvider.subTitle,
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
          Text(
            '${totalPlayedCups(gameProvider.cupMap).toString()} ROUNDS PLAYED',
            style: GoogleFonts.anton(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
