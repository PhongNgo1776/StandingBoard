import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/fonts.dart';
import 'package:standingboard/view_models/GameProvider.dart';

import 'ResultItem.dart';
import 'RoundItem.dart';

class MatchInfos extends StatefulWidget {
  const MatchInfos({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchInfos> createState() => _MatchInfosState();
}

class _MatchInfosState extends State<MatchInfos> {
  @override
  void initState() {
    var gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GameProvider>(context);
    if (gameProvider.rounds.isEmpty) {
      return Container(
        height: 0.5.sh,
        alignment: Alignment.center,
        child: Text(
          'Please wait its loading...',
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSize.large,
          ),
        ),
      );
    } else {
      print('----------SHOW NEW DATA');
      return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                gameProvider.rounds.length,
                (index) {
                  var round = gameProvider.rounds[index];
                  return RoundItem(
                    roundNum: round.roundNumber.toString(),
                    leftTeamFirstRound: round.matches[0].team1,
                    rightTeamFirstRound: round.matches[0].team2,
                    leftTeamSecondRound: round.matches.length >= 2
                        ? round.matches[1].team1
                        : null,
                    rightTeamSecondRound: round.matches.length >= 2
                        ? round.matches[1].team2
                        : null,
                    firstSchedule: round.matches[0].schedule,
                    secondSchedule: round.matches.length >= 2
                        ? round.matches[1].schedule
                        : null,
                  );
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                gameProvider.rounds.length,
                (index) {
                  var round = gameProvider.rounds[index];
                  return ResultItem(
                    firstResult:
                        '${round.matches[0].result.team1Goals} - ${round.matches[0].result.team2Goals}',
                    secondResult: round.matches.length >= 2
                        ? '${round.matches[1].result.team1Goals} - ${round.matches[1].result.team2Goals}'
                        : '',
                  );
                },
              ),
            ),
            Container(
              width: 0.2.sw,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time between matches',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                      Text(
                        '5 mins',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Match duration',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                      Text(
                        '25 mins',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Break durations',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                      Text(
                        '15 mins',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.xsmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
