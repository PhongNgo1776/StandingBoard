import 'package:flutter/widgets.dart';
import 'package:standingboard/utils/utils.dart';
import 'package:standingboard/widgets/custom_scrollbar.dart';

class DataWrapper extends StatelessWidget {
  const DataWrapper({
    Key? key,
    this.header,
    required this.body,
    this.flex,
  }) : super(key: key);

  final int? flex;
  final Widget? header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return flex != null
        ? Expanded(
            flex: flex!,
            child: DataWidget(
              header: header,
              body: body,
            ),
          )
        : DataWidget(
            header: header,
            body: body,
          );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
    this.header,
    required this.body,
  }) : super(key: key);

  final Widget? header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Column(
      children: [
        if (header != null) header!,
        isMobile
            ? body
            : Expanded(
                child: CustomScrollbar(
                  controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: body,
                  ),
                ),
              ),
      ],
    );
  }
}
