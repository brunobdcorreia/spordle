import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/guess_song_dropdown.dart';
import 'package:spordle/components/guess_song_lifebar.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/song_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/components/spordle_text_input.dart';
import 'package:spordle/constants/playlists.dart';
import 'package:spordle/constants/songs.dart';
import 'dart:math';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<StatefulWidget> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  static const int _maxGuesses = 5;
  Song? song;
  List<Song> songlist = [];
  bool _isPlaying = false;
  bool _hasGuessed = false;
  bool _hasLost = false;
  int _guesses = 0;

  // What happens when a user takes a guess
  void _onGuess(bool isCorrect) {
    if (!isCorrect) {
      setState(() {
        _guesses++;
      });

      Fluttertoast.showToast(msg: "You have $_guesses guesses");
    }

    if (_guesses == _maxGuesses) {
      // Game over
      setState(() {
        _hasLost = true;
      });

      Fluttertoast.showToast(msg: "You've failed to guess the song!");
      return;
    }

    if (isCorrect) {
      Fluttertoast.showToast(msg: "Correct answer!");
      setState(() {
        _guesses++;
        _hasGuessed = true;
      });
    }
  }

  // Play the audio
  void _playAudio(_) {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Playlist> playlistlist =
        ModalRoute.of(context)?.settings.arguments as List<Playlist>;

    final List<Song> songlist =
        playlistlist.expand((playlist) => playlist.songs).toList();

    Song selectRandomSong() {
      Random random = Random();
      List<Song> allSongsList = [];

      playlistlist.forEach((playlist) {
        allSongsList.addAll(playlist.songs);
      });

      return allSongsList[random.nextInt(allSongsList.length)];
    }

    // The null assessment prevents the song from changing by just refreshing
    // the page
    if (songlist.isNotEmpty) {
      song ??= selectRandomSong();
    }

    return SpordleScaffold(
        pageTitleText: "Guess the song",
        content: Column(children: [
          const Text("Tap the track to play it"),
          SongTile(
              song: _hasGuessed ? song! : mysterySong,
              isSelected: _isPlaying,
              select: _playAudio,
              isPlaying: _isPlaying),
          GuessSongLifebar(
              maxGuesses: _maxGuesses,
              lastGuess: _guesses,
              hasGuessed: _hasGuessed),
          GuessSongDropdown(
              songlist: songlist,
              correctSong: song!,
              onGuess: _onGuess,
              isGameRunning: (!_hasLost && !_hasGuessed)),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: RoundRectangularButton(
                  labelText: "Play again on this playlist",
                  onPressAction: () {})),
        ]));
  }
}
