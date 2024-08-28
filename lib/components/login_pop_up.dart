import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/spordle_text_input.dart';

class LoginPopUp extends AlertDialog {
  final String titleText;
  final String subtitle;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPopUp({super.key, required this.titleText, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    void loginToSpotify() {
      if (_loginController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        Fluttertoast.showToast(msg: "Will login to spotify");
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/select');
      }
    }

    void cancelLogin() {
      Fluttertoast.showToast(msg: "Login was cancelled");
      Navigator.of(context).pop();
    }

    return AlertDialog(
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        title: Text(titleText),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(subtitle),
          SpordleTextInput(
              label: "Login",
              hint: "Your email",
              controller: _loginController,
              type: TextInputType.emailAddress),
          SpordleTextInput(
              label: "Password",
              controller: _passwordController,
              type: TextInputType.text,
              isPassword: true)
        ]),
        actions: <Widget>[
          RoundRectangularButton(
              labelText: "Cancel", onPressAction: cancelLogin),
          RoundRectangularButton(
              labelText: "Login", onPressAction: loginToSpotify),
        ]);
  }
}
