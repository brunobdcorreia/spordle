// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_user_is_on_the_game_screen.dart';
import './step/the_user_sees.dart';
import './step/the_user_clicks_on_the_button.dart';
import './step/the_user_should_be_able_to_hear_a_portion_of_the_song.dart';

void main() {
  group('''Escutar trecho da música''', () {
    testWidgets('''User listens to a short music snippet''', (tester) async {
      await theUserIsOnTheGameScreen(tester);
      await theUserSees(tester, "Listen to snippet of the song");
      await theUserClicksOnTheButton(tester, "play");
      await theUserShouldBeAbleToHearAPortionOfTheSong(tester);
    });
  });
}
