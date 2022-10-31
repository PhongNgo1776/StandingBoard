import 'package:flutter/material.dart';

import '../utils/utils.dart';

class TeamRanking extends StatelessWidget {
  const TeamRanking({
    Key? key,
    required this.rank,
    required this.teamName,
    required this.points,
  }) : super(key: key);

  final int rank;
  final String teamName;
  final int? points;

  @override
  Widget build(BuildContext context) {
    var textColor = rank == 1 ? Colors.white : Color.fromRGBO(148, 146, 146, 1);
    var titleStyle = titleTextStyle.copyWith(color: textColor);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$rank. place',
            textAlign: TextAlign.left,
            style: titleStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            teamName,
            textAlign: TextAlign.left,
            style: titleStyle,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            '$points pts',
            textAlign: TextAlign.right,
            style: titleStyle,
          ),
        ),
      ],
    );
  }
}
