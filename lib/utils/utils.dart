import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts.dart';

TextStyle titleTextStyle = GoogleFonts.anton(
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: FontSize.medium,
  ),
);

bool get isMobile {
  var width = Get.width;
  var height = Get.height;
  var widthHeightRatio = width / height;

  return widthHeightRatio < 1.2;
}
