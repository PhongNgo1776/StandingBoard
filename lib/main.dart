import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/widgets/scale_route.dart';
import 'view_models/game_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GameProvider>(
            create: (context) => GameProvider()),
      ],
      child: ScreenUtilInit(
          designSize: Size(1280, 1024),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () {
            return MaterialApp(
              title: 'StandingBoard',
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/home':
                    return ScaleRoute(widget: HomeScreen(), settings: settings);
                  default:
                    return ScaleRoute(widget: HomeScreen(), settings: settings);
                }
              },
            );
          }),
    ),
  );
}
