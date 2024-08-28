import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/login_pop_up.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/spordle_scaffold.dart';

class BootPage extends StatefulWidget {
  const BootPage({super.key});

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  void showLoginPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoginPopUp(
              titleText: "Login", subtitle: "Login to your spotify account");
        });
  }

  @override
  Widget build(BuildContext context) {
    return SpordleScaffold(
        pageTitleText: "Spordle",
        showWallpaper: true,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Center(
                    child: Text(
                        'Please connect to your Spotify account to start',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onPrimary)))),
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: RoundRectangularButton(
                    labelText: "Login to spotify",
                    onPressAction: showLoginPopup))
          ],
        ));
  }
}
