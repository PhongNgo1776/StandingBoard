import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';

class TeamRankingRound extends StatelessWidget {
  const TeamRankingRound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.01.sw),
        child: Column(
          children: [
            InkWell(
              onTap: (() =>
                  Navigator.pushNamed(context, '/detail', arguments: 'Cup 1')),
              child: Ink(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: titelBgColor,
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Text(
                  'Round 1',
                  textAlign: TextAlign.center,
                  style: titleTextStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.025.sw,
                vertical: 0.01.sh,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Team 1',
                    textAlign: TextAlign.left,
                    style: titleTextStyle,
                  ),
                  Text(
                    '4',
                    textAlign: TextAlign.right,
                    style: titleTextStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
