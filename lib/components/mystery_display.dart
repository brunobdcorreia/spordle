import 'package:flutter/material.dart';
import 'package:spordle/constants/spordle_borders.dart';

class MysteryDisplay extends StatefulWidget {
  final String text;
  final List<String> revealedLetters;
  const MysteryDisplay(
      {super.key, required this.text, required this.revealedLetters});

  @override
  State<StatefulWidget> createState() => _MysteryDisplayState();
}

class _MysteryDisplayState extends State<MysteryDisplay> {
  @override
  Widget build(BuildContext context) {
    String title = widget.text.toUpperCase();
    List<Widget> tiles = [];

    for (int rune in title.runes) {
      String character = String.fromCharCode(rune);
      tiles.add(MysteryTile(
          character: character,
          isShown: widget.revealedLetters.contains(character)));
    }

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: tiles));
  }
}

class MysteryTile extends StatefulWidget {
  final String character;
  final bool isShown;
  const MysteryTile(
      {super.key, required this.character, required this.isShown});

  @override
  State<StatefulWidget> createState() => _MysteryTileState();
}

class _MysteryTileState extends State<MysteryTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.character == " ") return const SizedBox(height: 50, width: 25);

    return Container(
        height: 50,
        width: 30,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: SpordleBorders.primaryStrokeBorder(
                Theme.of(context).colorScheme.primary),
            borderRadius: SpordleBorders.tiltBorders),
        child: Text(widget.isShown ? widget.character[0] : "•",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 30)));
  }
}

class GuessLetterGrid extends StatefulWidget {
  final String text;
  final Function(String) onTapBlock;
  const GuessLetterGrid(
      {super.key, required this.text, required this.onTapBlock});

  @override
  State<StatefulWidget> createState() => _GuessLetterGridState();
}

class _GuessLetterGridState extends State<GuessLetterGrid> {
  @override
  Widget build(BuildContext context) {
    String title = widget.text.toUpperCase();
    List<GuessLetterBlock> letters = [];

    for (int index = 65; index <= 90; index++) {
      String character = String.fromCharCode(index);
      letters.add(GuessLetterBlock(
          letter: character,
          isPresentInSongTitle: title.contains(character),
          isSelected: false,
          onTapBlock: widget.onTapBlock));
    }

    return Expanded(
        child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: letters));
  }
}

class GuessLetterBlock extends StatefulWidget {
  final String letter;
  final bool isPresentInSongTitle;
  final bool isSelected;
  final Function(String) onTapBlock;
  const GuessLetterBlock(
      {super.key,
      required this.letter,
      required this.isPresentInSongTitle,
      required this.isSelected,
      required this.onTapBlock});

  @override
  State<StatefulWidget> createState() => _GuessLetterBlockState();
}

class _GuessLetterBlockState extends State<GuessLetterBlock> {
  bool? _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _activate() {
    if (!_isSelected!) {
      setState(() {
        _isSelected = true;
      });
      widget.onTapBlock(widget.letter);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderAndTextColor = Theme.of(context).colorScheme.primary;
    Color backgroundColor = Theme.of(context).colorScheme.onPrimary;

    if (_isSelected! && widget.isPresentInSongTitle) {
      borderAndTextColor = Theme.of(context).colorScheme.onPrimary;
      backgroundColor = Theme.of(context).colorScheme.primary;
    }
    if (_isSelected! && !widget.isPresentInSongTitle) {
      borderAndTextColor = Theme.of(context).colorScheme.onError;
      backgroundColor = Theme.of(context).colorScheme.error;
    }

    return GestureDetector(
        onTap: _activate,
        child: Container(
            height: 20,
            width: 30,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundColor,
                border: SpordleBorders.primaryStrokeBorder(borderAndTextColor),
                borderRadius: SpordleBorders.tiltBorders),
            child: Text(widget.letter,
                style: TextStyle(color: borderAndTextColor, fontSize: 30))));
  }
}
