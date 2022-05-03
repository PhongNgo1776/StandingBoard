import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standingboard/utils/fonts.dart';

class MatchSchedule extends StatelessWidget {
  const MatchSchedule({
    Key? key,
    required this.firstSchedule,
    required this.secondSchedule,
  }) : super(key: key);

  final String firstSchedule;
  final String? secondSchedule;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          firstSchedule,
          textAlign: TextAlign.center,
          style: GoogleFonts.anton(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.medium,
            ),
          ),
        ),
        Text(
          secondSchedule ?? '',
          textAlign: TextAlign.center,
          style: GoogleFonts.anton(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.medium,
            ),
          ),
        ),
      ],
    );
  }
}
