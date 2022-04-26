class Setting {
  Setting(
      {this.header,
      this.footer,
      this.alternativeFooter,
      this.logoURL,
      this.intervalReloading = 10});
  final String? header;
  final String? footer;
  final String? alternativeFooter;
  final String? logoURL;
  final int intervalReloading;
}
