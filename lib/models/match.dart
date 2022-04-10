class Match {
  Match({this.team1, this.team2, this.schedule, this.result});
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
  MatchResult({this.team1Goals, this.team2Goals});
  final int team1Goals;
  final int team2Goals;
}
