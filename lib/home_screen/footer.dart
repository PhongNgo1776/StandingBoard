import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 10.h : 20.h),
      color: Color(0xFF202020),
      child: RichText(
        text: TextSpan(
            text: gameProvider.setting?.footer ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: FontSize.small,
            ),
            children: [
              TextSpan(
                text: ' ${gameProvider.setting?.alternativeFooter ?? ''}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ]),
      ),
    );
  }
}
