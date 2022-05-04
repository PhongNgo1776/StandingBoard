// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import 'data_info_table.dart';
import 'footer.dart';
import 'header.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GoogleSheetProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: InteractiveViewer(
          minScale: 1,
          maxScale: isMobile ? 2 : 1,
          child: Column(
            children: [
              Header(),
              Expanded(flex: 8, child: DataInfoTable()),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
