class Standing {
  Standing({required this.team, required this.point});
  final String team;
  final int point;

  void debugLog() {
    print("$team - $point");
  }
}
