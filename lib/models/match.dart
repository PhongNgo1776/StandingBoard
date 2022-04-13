class Match {
  Match(
      {required this.team1,
      required this.team2,
      required this.schedule,
      required this.result});
  final String team1;
  final String team2;
  final String schedule;
  final MatchResult result;
  void debugLog() {
    print(
        "$team1 vs $team2 at $schedule [${result.team1Goals} - ${result.team2Goals}]");
  }
}

class MatchResult {
  MatchResult({required this.team1Goals, required this.team2Goals});
  final int team1Goals;
  final int team2Goals;
}
