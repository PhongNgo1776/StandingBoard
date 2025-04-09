// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';

import 'data_info_table.dart';
import 'footer.dart';
import 'header.dart';

class DetailTouramentScreen extends StatefulWidget {
  const DetailTouramentScreen({super.key});
  @override
  State<DetailTouramentScreen> createState() => _DetailTouramentScreenState();
}

class _DetailTouramentScreenState extends State<DetailTouramentScreen> {
  late GoogleSheetProvider provider;
  late String? cupName;

  @override
  void initState() {
    String url = Uri.decodeFull(Uri.base.fragment);
    cupName = url.split('?')[1].split('=')[1];
    provider = Provider.of<GoogleSheetProvider>(context, listen: false);
    provider.currentCupName = cupName;
    provider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GoogleSheetProvider>(context);
    return WillPopScope(
      onWillPop: () {
        provider.clearCurrentCupName();
        return Future.value(true);
      },
      child: provider.isLoading
          ? Center(
              child: Image.network(
                'https://phongngo1776.github.io/StandingBoard/loading.gif',
                width: 0.2.sw,
              ),
            )
          : SafeArea(
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
            ),
    );
  }
}
