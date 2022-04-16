import 'package:flutter/material.dart';

class CustomScrollbar extends StatefulWidget {
  const CustomScrollbar({
    Key? key,
    required this.child,
    this.controller,
    this.horizontalPadding = 0.0,
    this.isAlwaysShown = true,
  }) : super(key: key);

  final Widget child;
  final double horizontalPadding;
  final ScrollController? controller;
  final bool isAlwaysShown;

  @override
  _CustomScrollbarState createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  bool showScrollbar = false;

  @override
  Widget build(BuildContext context) {
    showScrollbarAfterBuild();
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: showScrollbar
          ? RawScrollbar(
              isAlwaysShown: widget.isAlwaysShown,
              thumbColor: Colors.grey,
              thickness: 4,
              radius: Radius.circular(5),
              controller: widget.controller,
              child: widget.child,
            )
          : widget.child,
    );
  }

  void showScrollbarAfterBuild() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        if (mounted) setState(() => showScrollbar = true);
      },
    );
  }
}
