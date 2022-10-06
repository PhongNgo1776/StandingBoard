import 'package:flutter/material.dart';

import '../utils/utils.dart';

class TeamRanking extends StatelessWidget {
  const TeamRanking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '1. place',
            textAlign: TextAlign.left,
            style: titleTextStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'TRD Underdogs',
            textAlign: TextAlign.left,
            style: titleTextStyle,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            '16 pts',
            textAlign: TextAlign.right,
            style: titleTextStyle,
          ),
        ),
      ],
    );
  }
}
