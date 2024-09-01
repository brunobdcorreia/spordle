// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_user_has_guessed_a_song.dart';
import './step/the_user_sees_their_score.dart';
import './step/the_user_click_on_button.dart';
import './step/the_system_must_show_discounts_and_additions_to_the_respective_score.dart';

void main() {
  group('''Visualizar pontuação ao acertar a música''', () {
    testWidgets('''User views their score after guessing a song''',
        (tester) async {
      await theUserHasGuessedASong(tester);
      await theUserSeesTheirScore(tester);
      await theUserClickOnButton(tester, "Show more");
      await theSystemMustShowDiscountsAndAdditionsToTheRespectiveScore(tester);
    });
  });
}
