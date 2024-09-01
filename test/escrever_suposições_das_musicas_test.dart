// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_user_is_on_the_game_screen.dart';
import './step/that_the_correct_answer_is.dart';
import './step/the_user_sees_a_text_box.dart';
import './step/the_user_types.dart';
import './step/the_user_clicks_on_the_guess_button.dart';
import './step/the_system_should_show_that_answer_is_correct.dart';
import './step/the_system_should_show_that_the_answer_is_wrong_and_show_how_many_attempts_are_left.dart';

void main() {
  group('''Escrever suposições das músicas''', () {
    testWidgets('''User guesses a song by typing on the first try''',
        (tester) async {
      await theUserIsOnTheGameScreen(tester);
      await thatTheCorrectAnswerIs(tester, "Tango Noir");
      await theUserSeesATextBox(tester);
      await theUserTypes(tester, "Tango Noir");
      await theUserClicksOnTheGuessButton(tester);
      await theSystemShouldShowThatAnswerIsCorrect(tester);
    });
    testWidgets('''User doesn't guess the song on the first try''',
        (tester) async {
      await theUserIsOnTheGameScreen(tester);
      await thatTheCorrectAnswerIs(tester, "Tango Noir");
      await theUserSeesATextBox(tester);
      await theUserTypes(tester, "505");
      await theUserClicksOnTheGuessButton(tester);
      await theSystemShouldShowThatTheAnswerIsWrongAndShowHowManyAttemptsAreLeft(
          tester);
    });
  });
}
