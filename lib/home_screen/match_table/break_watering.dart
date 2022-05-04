import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/utils/utils.dart';

class BreakWatering extends StatelessWidget {
  const BreakWatering({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.only(left: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: false,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20.w : 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Color(0xFF767676),
                    ),
                    child: Text('0'),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Break - Watering',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.xsmall,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 0.03.sw),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
          ),
        ),
      ],
    );
  }
}
