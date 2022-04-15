class PointInfo {
  PointInfo(
      {required this.winTitle,
      required this.winValue,
      required this.drawTitle,
      required this.drawValue,
      required this.lossTitle,
      required this.lossValue});
  final String winTitle;
  final int winValue;
  final String drawTitle;
  final int drawValue;
  final String lossTitle;
  final int lossValue;

  void printDebug() {
    print('========= Points ==========');
    print('$winTitle: $winValue');
    print('$drawTitle: $drawValue');
    print('$lossTitle: $lossValue');
    print('===================');
  }
}
