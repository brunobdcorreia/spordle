import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/guess_song_dropdown.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/song_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/components/spordle_text_input.dart';
import 'package:spordle/constants/songs.dart';
import 'dart:math';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<StatefulWidget> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  Song? song;
  bool _isPlaying = false;
  bool _hasGuessed = false;
  bool _hasLost = false;
  int _guesses = 5;

  // What happens when a user takes a guess
  void _onGuess(bool isCorrect) {
    if (!isCorrect) {
      setState(() {
        _guesses--;
      });

      Fluttertoast.showToast(msg: "You have $_guesses guesses");
    }

    if (_guesses == 0) {
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
    final List<Song> songlist =
        ModalRoute.of(context)?.settings.arguments as List<Song>;

    Song selectRandomSong() {
      Random random = Random();
      int randomIndex = random.nextInt(songlist.length);

      return songlist[randomIndex];
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
          GuessSongDropdown(
              songlist: songlist,
              correctSong: song!,
              onGuess: _onGuess,
              isGameRunning: (!_hasLost && !_hasGuessed)),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: RoundRectangularButton(
                  labelText: "Submit your guess", onPressAction: () {})),
        ]));
  }
}
