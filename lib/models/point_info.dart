class PointInfo {
  PointInfo(
      {required this.winTitle,
      required this.winValue,
      required this.drawTitle,
      required this.drawValue,
      required this.lossTitle,
      required this.lossValue});
  final String winTitle;
  final String winValue;
  final String drawTitle;
  final String drawValue;
  final String lossTitle;
  final String lossValue;

  void printDebug() {
    print('========= Points ==========');
    print('$winTitle: $winValue');
    print('$drawTitle: $drawValue');
    print('$lossTitle: $lossValue');
    print('===================');
  }
}
