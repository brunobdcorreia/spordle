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
    final currentRoute = ModalRoute.of(context)?.settings.name;

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
        appBar: currentRoute == "/"
            ? AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                automaticallyImplyLeading: false,
                title: Text(widget.pageTitleText,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20)),
              )
            : SpordleBar(
                title: widget.pageTitleText,
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            Navigator.pushNamed(context, '/select');
                          })),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(Icons.bar_chart),
                        onPressed: () {
                          Navigator.pushNamed(context, '/statistics');
                        },
                      ))
                ],
              ),
        body: body);
  }
}
