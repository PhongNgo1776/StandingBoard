// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/screens/widgets/data_info_table.dart';
import 'package:standingboard/screens/widgets/footer.dart';
import 'package:standingboard/screens/widgets/header.dart';
import 'package:standingboard/view_models/game_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GameProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Header(),
            Expanded(flex: 8, child: DataInfoTable()),
            Footer()
          ],
        ),
      ),
    );
  }
}
