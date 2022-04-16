import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/view_models/game_provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GameProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.05.sh, horizontal: 0.1.sw),
      child: Row(
        children: [
          Image.network(
            gameProvider.logoURL.isEmpty
                ? 'https://phongngo1776.github.io/StandingBoard/loading.gif'
                : gameProvider.logoURL,
            width: 100.r,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text(
              gameProvider.headerText,
              style: GoogleFonts.anton(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
