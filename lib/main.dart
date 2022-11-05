import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'detail_tourament_screen/detail_tournament_screen.dart';
import 'tourament_list_screen/tourament_list_screen.dart';
import 'view_models/google_sheet_provider.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'view_models/time_provider.dart';
import 'widgets/scale_route.dart';

void main() {
  tz.initializeTimeZones();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSheetProvider>(
            create: (context) => GoogleSheetProvider()),
        ChangeNotifierProvider<TimeProvider>(
            create: (context) => TimeProvider()),
      ],
      child: ScreenUtilInit(
          designSize: isMobile ? Size(1280, 720) : Size(1920, 1200),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () {
            initializeDateFormatting('az');
            return MaterialApp(
              title: 'StandingBoard',
              debugShowCheckedModeBanner: false,
              home: TouramentListScreen(),
              onGenerateRoute: (RouteSettings settings) {
                var mainPath = settings.name?.split('?').first;
                switch (mainPath) {
                  case '/detail':
                    return ScaleRoute(
                        widget: DetailTouramentScreen(), settings: settings);
                  default:
                    return ScaleRoute(
                        widget: TouramentListScreen(), settings: settings);
                }
              },
            );
          }),
    ),
  );
}
