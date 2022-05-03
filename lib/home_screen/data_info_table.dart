import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/view_models/google_sheet_provider.dart';
import 'package:standingboard/widgets/custom_scrollbar.dart';

import 'data_wrapper.dart';
import 'loading_msg.dart';
import 'match_table/match_group_header.dart';
import 'other_info_table/other_info_table.dart';
import 'match_table/match_group_body.dart';

class DataInfoTable extends StatefulWidget {
  DataInfoTable({
    Key? key,
  }) : super(key: key);

  @override
  State<DataInfoTable> createState() => _DataInfoTableState();
}

class _DataInfoTableState extends State<DataInfoTable> {
  late GoogleSheetProvider gameProvider;
  @override
  void initState() {
    gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    gameProvider.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0.02.sw : 0.05.sw),
      child: isMobile
          ? CustomScrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                child: ColumnData(),
              ),
            )
          : ColumnData(),
    );
  }
}

class ColumnData extends StatelessWidget {
  const ColumnData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameProvider = Provider.of<GoogleSheetProvider>(context, listen: false);
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      children: [
        Container()
        // DataWrapper(
        //   flex: isMobile ? null : 8,
        //   header: MatchGroupHeader(titleTextStyle: titleTextStyle),
        //   body: gameProvider.rounds.isEmpty ? LoadingMsg() : MatchGroupBody(),
        // ),
        // Container(
        //   margin: EdgeInsets.only(top: isMobile ? 30.h : 0),
        //   child: DataWrapper(
        //     flex: isMobile ? null : 2,
        //     body: gameProvider.rounds.isEmpty ? SizedBox() : OtherInfoTable(),
        //   ),
        // ),
      ],
    );
  }
}
