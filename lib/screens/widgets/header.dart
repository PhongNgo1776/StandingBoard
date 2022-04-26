import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timezone/browser.dart' as tz;
import 'package:standingboard/view_models/game_provider.dart';
import 'package:timezone/timezone.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GameProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.05.sh, horizontal: 0.1.sw),
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
  TZDateTime? now;
  DateFormat dateFormat = DateFormat('HH:mm', 'nb_NO');

  @override
  void initState() {
    tz.initializeTimeZone();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      setup();
    });
    super.initState();
  }

  Future<void> setup() async {
    Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$formattedTime',
        style: GoogleFonts.changa(
          textStyle: TextStyle(
            fontSize: 60.sp,
            fontWeight: FontWeight.w500,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  String get formattedTime {
    var detroit = tz.getLocation('Europe/Oslo');
    var now = tz.TZDateTime.now(detroit);

    return dateFormat.format(now);
  }
}
