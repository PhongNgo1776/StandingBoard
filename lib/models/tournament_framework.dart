class TournamentFramework {
  TournamentFramework(
      {this.timeBetweenMatchesName,
      this.timeBetweenMatchesValue,
      this.title,
      this.matchDurationName,
      this.matchDurationValue,
      this.breakDurationName,
      this.breakDurationValue});
  final String timeBetweenMatchesName;
  final int timeBetweenMatchesValue;
  final String title;
  final String matchDurationName;
  final int matchDurationValue;
  final String breakDurationName;
  final int breakDurationValue;
}
