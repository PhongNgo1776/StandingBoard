import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/colors.dart';
import 'package:standingboard/utils/utils.dart';

class OtherInfoHeader extends StatelessWidget {
  const OtherInfoHeader({
    Key? key,
    required this.title,
    this.needMarginTop = true,
  }) : super(key: key);

  final String title;
  final bool needMarginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: isMobile ? 0.95.sw : 0.2.sw,
      margin: EdgeInsets.only(
          top: needMarginTop ? (isMobile ? 10.h : 30.h) : 0,
          right: isMobile ? 30.w : 0),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: titelBgColor,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Text(title, style: titleTextStyle),
    );
  }
}
