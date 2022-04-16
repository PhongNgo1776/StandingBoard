import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/utils.dart';

class OtherInfoHeader extends StatelessWidget {
  const OtherInfoHeader({
    Key? key,
    required this.title,
    this.marginTop = 0.0,
  }) : super(key: key);

  final String title;
  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 0.2.sw,
      margin: EdgeInsets.only(top: marginTop.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: Color(TITLE_BG_COLOR),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Text(title, style: titleTextStyle),
    );
  }
}
