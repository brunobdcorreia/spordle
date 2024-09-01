// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_user_is_logged_on_your_correct_spotify_account.dart';
import './step/the_user_is_on_the_playlist_selection_screen.dart';
import './step/the_user_sees_section.dart';
import './step/the_user_selects_playlist.dart';
import './step/the_system_must_choose_one_of_the_songs_from_the_selected_playlists.dart';

void main() {
  group('''Selecionar playlist do Spotify''', () {
    testWidgets(
        '''User views their Spotify playlists for song selection and select some of them''',
        (tester) async {
      await theUserIsLoggedOnYourCorrectSpotifyAccount(tester);
      await theUserIsOnThePlaylistSelectionScreen(tester);
      await theUserSeesSection(tester, "My playlists");
      await theUserSelectsPlaylist(tester, "ebaaaaa");
      await theSystemMustChooseOneOfTheSongsFromTheSelectedPlaylists(tester);
    });
  });
}
