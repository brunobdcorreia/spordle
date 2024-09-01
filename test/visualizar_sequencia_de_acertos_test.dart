// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_user_is_on_the_statistics_screen.dart';
import './step/the_user_sees_section.dart';
import './step/the_user_clicks_on_button.dart';
import './step/the_correct_guess_streak_should_be_displayed.dart';

void main() {
  group('''Visualizar sequência de acertos''', () {
    testWidgets('''User views their correct guess streak''', (tester) async {
      await theUserIsOnTheStatisticsScreen(tester);
      await theUserSeesSection(tester, "My profile");
      await theUserClicksOnButton(tester, "Streak");
      await theCorrectGuessStreakShouldBeDisplayed(tester);
    });
  });
}
