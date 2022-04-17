import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/fonts.dart';

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
            padding: EdgeInsets.symmetric(
              horizontal: 55.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h, right: 5.w),
                    child: Text(
                      'Break - Watering',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: FontSize.xsmall,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
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
