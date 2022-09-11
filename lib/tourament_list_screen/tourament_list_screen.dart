// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

class TouramentListScreen extends StatefulWidget {
  @override
  State<TouramentListScreen> createState() => _TouramentListScreenState();
}

class _TouramentListScreenState extends State<TouramentListScreen> {
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
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/detail',
                    arguments: 'Tournament'),
                child: Text(
                  '------LIST',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
