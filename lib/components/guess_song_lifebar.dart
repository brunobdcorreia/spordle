import 'package:flutter/material.dart';
import 'package:spordle/constants/spordle_borders.dart';

class GuessSongLifebar extends StatefulWidget {
  final int maxGuesses;
  final int lastGuess;
  final bool hasGuessed;
  const GuessSongLifebar(
      {super.key,
      required this.maxGuesses,
      this.lastGuess = -1,
      required this.hasGuessed});

  @override
  State<StatefulWidget> createState() => _GuessSongLifebarState();
}

class _GuessSongLifebarState extends State<GuessSongLifebar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> lifeTicks = [];

    // Update it based on the last guess
    for (int counter = 1; counter <= widget.maxGuesses; counter++) {
      if (counter < widget.lastGuess) {
        lifeTicks.add(LifeTick(status: false, maxGuesses: widget.maxGuesses));
      }
      if (counter == widget.lastGuess && widget.hasGuessed) {
        lifeTicks.add(LifeTick(status: true, maxGuesses: widget.maxGuesses));
      }
      if (counter == widget.lastGuess && !widget.hasGuessed) {
        lifeTicks.add(LifeTick(status: false, maxGuesses: widget.maxGuesses));
      }
      if (counter > widget.lastGuess) {
        lifeTicks.add(LifeTick(status: null, maxGuesses: widget.maxGuesses));
      }
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 24,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center, children: lifeTicks));
  }
}

class LifeTick extends StatefulWidget {
  final bool? status;
  final int maxGuesses;
  const LifeTick({super.key, required this.status, required this.maxGuesses});

  @override
  State<StatefulWidget> createState() => _LifeTickState();
}

class _LifeTickState extends State<LifeTick> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).colorScheme.surfaceDim;

    if (widget.status == true) {
      backgroundColor = Theme.of(context).colorScheme.primary;
    }
    if (widget.status == false) {
      backgroundColor = Theme.of(context).colorScheme.error;
    }

    return Container(
      width: MediaQuery.of(context).size.width / widget.maxGuesses * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height / 36,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: SpordleBorders.tiltBorders),
    );
  }
}
