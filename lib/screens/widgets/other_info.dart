import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/view_models/game_provider.dart';

import 'other_info_header.dart';

class OtherInfo extends StatelessWidget {
  const OtherInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GameProvider>(context, listen: false);
    return Column(
      children: [
        Container(
          width: 0.2.sw,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.tournamentFramework.timeBetweenMatchesName,
                value: gameProvider.tournamentFramework.timeBetweenMatchesValue
                        .toString() +
                    ' mins',
              ),
              SizedBox(height: 10.h),
              TitleValueItem(
                title: gameProvider.tournamentFramework.matchDurationName,
                value: gameProvider.tournamentFramework.matchDurationValue
                        .toString() +
                    ' mins',
              ),
              SizedBox(height: 10.h),
              TitleValueItem(
                title: gameProvider.tournamentFramework.breakDurationName,
                value: gameProvider.tournamentFramework.breakDurationValue
                        .toString() +
                    ' mins',
              ),
            ],
          ),
        ),
        OtherInfoHeader(
          title: 'Points',
          marginTop: 30,
        ),
        Container(
          width: 0.2.sw,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.pointInfo.winTitle,
                value: gameProvider.pointInfo.winValue.toString() + ' points',
              ),
              SizedBox(height: 10.h),
              TitleValueItem(
                title: gameProvider.pointInfo.drawTitle,
                value: gameProvider.pointInfo.drawValue.toString() + ' points',
              ),
              SizedBox(height: 10.h),
              TitleValueItem(
                title: gameProvider.pointInfo.lossTitle,
                value: gameProvider.pointInfo.lossValue.toString() + ' points',
              ),
            ],
          ),
        ),
        OtherInfoHeader(
          title: 'Standings',
          marginTop: 30,
        ),
        Container(
          width: 0.2.sw,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              gameProvider.standings.length,
              (index) => TitleValueItem(
                title: gameProvider.standings[index].team,
                value: gameProvider.standings[index].point.toString(),
              ),
            ),
          ),
        ),
        OtherInfoHeader(
          title: 'Winner 2022',
          marginTop: 30,
        ),
        Container(
          width: 0.2.sw,
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleValueItem(
                title: gameProvider.winner,
                value: '0',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TitleValueItem extends StatelessWidget {
  const TitleValueItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.francoisOne(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.small,
            ),
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: GoogleFonts.francoisOne(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: FontSize.small,
            ),
          ),
        ),
      ],
    );
  }
}
