import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/utils/fonts.dart';

class LoadingMsg extends StatelessWidget {
  const LoadingMsg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      alignment: Alignment.center,
      child: Text(
        'Please wait its loading...',
        style: TextStyle(
          color: Colors.white,
          fontSize: FontSize.xlarge,
        ),
      ),
    );
  }
}
