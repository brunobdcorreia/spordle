import 'package:flutter/material.dart';
import 'package:spordle/components/spordle_bar.dart';

class SpordleScaffold extends StatefulWidget {
  final String pageTitleText;
  final Widget content;
  final bool showWallpaper;

  const SpordleScaffold(
      {super.key,
      required this.pageTitleText,
      required this.content,
      this.showWallpaper = false});

  @override
  State<StatefulWidget> createState() => _SpordleScaffoldState();
}

class _SpordleScaffoldState extends State<SpordleScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget body = widget.showWallpaper
        ? Stack(children: [
            SizedBox.expand(
                child: Image.asset(
              "assets/akinaheadphones.jpg",
              fit: BoxFit.fitHeight,
            )),
            widget.content
          ])
        : widget.content;
    return Scaffold(
        appBar: SpordleBar(title: widget.pageTitleText), body: body);
  }
}
