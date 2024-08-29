import 'package:flutter/material.dart';
import 'package:spordle/constants/songs.dart';
import 'package:spordle/constants/spordle_borders.dart';

class GuessSongDropdown extends StatefulWidget {
  final List<Song> songlist;
  final Song correctSong;
  final bool isGameRunning;
  final Function(bool isCorrect) onGuess;
  const GuessSongDropdown(
      {super.key,
      required this.songlist,
      required this.correctSong,
      required this.isGameRunning,
      required this.onGuess});

  @override
  State<StatefulWidget> createState() => _GuessSongDropdownState();
}

class _GuessSongDropdownState extends State<GuessSongDropdown> {
  List<GuessSongTile> _getGuessTiles() {
    List<GuessSongTile> guessTiles = [];

    for (Song song in widget.songlist) {
      guessTiles.add(GuessSongTile(
          song: song,
          isTheCorrectSong: song == widget.correctSong,
          isGameRunning: widget.isGameRunning,
          onGuess: widget.onGuess));
    }

    return guessTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: SpordleBorders.tiltBorders),
                child: Column(children: _getGuessTiles()))));
  }
}

class GuessSongTile extends StatefulWidget {
  final Song song;
  final bool isTheCorrectSong;
  final bool isGameRunning;
  final Function(bool isCorrect) onGuess;
  const GuessSongTile(
      {super.key,
      required this.song,
      required this.isTheCorrectSong,
      required this.isGameRunning,
      required this.onGuess});

  @override
  State<StatefulWidget> createState() => _GuessSongTileState();
}

class _GuessSongTileState extends State<GuessSongTile> {
  bool _hasBeenTapped = false;

  void _onTap() {
    // Buttons don't work anymore
    if (!widget.isGameRunning) return;

    setState(() {
      _hasBeenTapped = true;
    });
    widget.onGuess(widget.isTheCorrectSong);
  }

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? textColor;

    if (!_hasBeenTapped) {
      backgroundColor = Theme.of(context).colorScheme.surfaceContainerHighest;
      textColor = Theme.of(context).colorScheme.onSurface;
    }

    if (_hasBeenTapped && widget.isTheCorrectSong) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      textColor = Theme.of(context).colorScheme.onPrimary;
    }

    if (_hasBeenTapped && !widget.isTheCorrectSong) {
      backgroundColor = Theme.of(context).colorScheme.error;
      textColor = Theme.of(context).colorScheme.onError;
    }

    return GestureDetector(
        onTap: _onTap,
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 18,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: SpordleBorders.tiltBorders),
            child: Text(widget.song.title,
                style: TextStyle(color: textColor, fontSize: 20))));
  }
}
