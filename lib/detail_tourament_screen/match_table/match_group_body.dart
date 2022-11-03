import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import 'match_group_item.dart';

class MatchGroupBody extends StatelessWidget {
  const MatchGroupBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context);
    return Container(
      key: ValueKey('MatchGroupBody-${gameProvider.currentCup}'),
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          gameProvider.currentCup?.rounds.length ?? 0,
          (index) {
            var round = gameProvider.currentCup!.rounds[index];
            return MatchGroupItem(
              key: ValueKey('MatchGroupItem$index'),
              showBreakTitle: index > 0,
              roundNum: round.roundNumber.toString(),
              leftTeamFirstRound: round.matches[0].team1,
              rightTeamFirstRound: round.matches[0].team2,
              leftTeamSecondRound:
                  round.matches.length >= 2 ? round.matches[1].team1 : null,
              rightTeamSecondRound:
                  round.matches.length >= 2 ? round.matches[1].team2 : null,
              firstSchedule: round.matches[0].schedule,
              secondSchedule:
                  round.matches.length >= 2 ? round.matches[1].schedule : null,
              firstResult:
                  '${round.matches[0].result.team1Goals} - ${round.matches[0].result.team2Goals}',
              secondResult: round.matches.length >= 2
                  ? '${round.matches[1].result.team1Goals} - ${round.matches[1].result.team2Goals}'
                  : '',
            );
          },
        ),
      ),
    );
  }
}
