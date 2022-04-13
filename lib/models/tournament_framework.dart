class TournamentFramework {
  TournamentFramework(
      {required this.timeBetweenMatchesName,
      required this.timeBetweenMatchesValue,
      required this.title,
      required this.matchDurationName,
      required this.matchDurationValue,
      required this.breakDurationName,
      required this.breakDurationValue});
  final String timeBetweenMatchesName;
  final int timeBetweenMatchesValue;
  final String title;
  final String matchDurationName;
  final int matchDurationValue;
  final String breakDurationName;
  final int breakDurationValue;
}
