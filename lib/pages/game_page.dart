import 'package:flutter/material.dart';
import 'package:spordle/components/mystery_display.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/constants/songs.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<String> _revealedLetters = [];
  Song? song;

  Song _selectRandomSong(List<Song> songlist) {
    Random random = Random();
    int randomIndex = random.nextInt(songlist.length);

    return songlist[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    final List<Song> songlist =
        ModalRoute.of(context)?.settings.arguments as List<Song>;

    // The null assessment prevents the song from changing by just refreshing
    // the page
    if (songlist.isNotEmpty) {
      song ??= _selectRandomSong(songlist);
    }

    // Pick the next song or go back
    void pickSongOrReturn() {
      songlist.remove(song);
      if (songlist.isNotEmpty) {
        setState(() {
          song = null; // Will force a new song to be chosen
        });
      } else {
        Navigator.of(context).pop();
      }
    }

    void revealLetter(String letter) {
      setState(() {
        _revealedLetters.add(letter);
      });
    }

    return SpordleScaffold(
        pageTitleText: "Game",
        content: Column(children: [
          TextButton(onPressed: pickSongOrReturn, child: Text(song!.title)),
          const Text("Guess the song"),
          MysteryDisplay(text: song!.title, revealedLetters: _revealedLetters),
          GuessLetterGrid(text: song!.title, onTapBlock: revealLetter),
        ]));
  }
}
