import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/utils.dart';

class OtherInfoBodyContainer extends StatelessWidget {
  const OtherInfoBodyContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 0.95.sw : 0.2.sw,
      margin: EdgeInsets.only(right: isMobile ? 30.w : 0),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 0.1.sw : 15.w,
        0,
        isMobile ? 0.1.sw : 15.w,
        10.h,
      ),
      child: child,
    );
  }
}
