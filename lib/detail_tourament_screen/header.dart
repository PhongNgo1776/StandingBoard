import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';
import 'package:standingboard/view_models/time_provider.dart';

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
                gameProvider.setting?.logoURL ??
                    'https://phongngo1776.github.io/StandingBoard/loading.gif',
                width: 100.r,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  gameProvider.setting?.header ?? '',
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
          Clock()
        ],
      ),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({
    Key? key,
  }) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late TimeProvider timeProvider;
  @override
  void initState() {
    timeProvider = Provider.of<TimeProvider>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      timeProvider.setup();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeProvider = Provider.of<TimeProvider>(context);
    return Text(
      '${timeProvider.formattedTime}',
      style: GoogleFonts.anton(
        textStyle: TextStyle(
          fontSize: 40.sp,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(196, 196, 196, 1),
        ),
      ),
    );
  }
}
