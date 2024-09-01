// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_am_on_the_login_page.dart';
import './step/i_click_the_button.dart';
import './step/i_enter_in_the_field.dart';
import './step/i_should_see_the_playlist_page.dart';

void main() {
  group('''Login''', () {
    testWidgets('''User logs in''', (tester) async {
      await iAmOnTheLoginPage(tester);
      await iClickTheButton(tester, 'Login to Spotify');
      await iEnterInTheField(tester, 'user', 'Login');
      await iEnterInTheField(tester, 'password', 'Password');
      await iClickTheButton(tester, 'Login');
      await iShouldSeeThePlaylistPage(tester);
    });
  });
}
