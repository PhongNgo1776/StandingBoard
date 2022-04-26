class TournamentFramework {
  TournamentFramework(
      {required this.timeBetweenMatchesName,
      required this.timeBetweenMatchesValue,
      required this.matchDurationName,
      required this.matchDurationValue,
      required this.breakDurationName,
      required this.breakDurationValue});
  final String timeBetweenMatchesName;
  final String timeBetweenMatchesValue;
  final String matchDurationName;
  final String matchDurationValue;
  final String breakDurationName;
  final String breakDurationValue;

  void printDebug() {
    print('========= Tournament framework ==========');
    print('$timeBetweenMatchesName: $timeBetweenMatchesValue');
    print('$matchDurationName: $matchDurationValue');
    print('$breakDurationName: $breakDurationValue');
    print('===================');
  }
}
