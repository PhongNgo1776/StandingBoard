// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:standingboard/widgets/custom_scrollbar.dart';

import 'table_body.dart';
import 'table_header.dart';

class DataInfoTable extends StatelessWidget {
  DataInfoTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
      child: Column(
        children: [
          TableHeader(),
          Expanded(
            child: CustomScrollbar(
              child: SingleChildScrollView(
                child: TableBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
