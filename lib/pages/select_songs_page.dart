import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/song_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/constants/songs.dart';

class SelectSongsPage extends StatefulWidget {
  const SelectSongsPage({super.key});

  @override
  State<SelectSongsPage> createState() => _SelectSongsPageState();
}

class _SelectSongsPageState extends State<SelectSongsPage> {
  int _amountSelectedSongs = 0;
  final List<Widget> _songTiles = [];
  final List<bool> _selections =
      List.generate(songlist.length, (index) => false);

  String _getButtonText() {
    if (_amountSelectedSongs > 1) {
      return "Play with $_amountSelectedSongs songs";
    }
    if (_amountSelectedSongs == 1) {
      return "Select at least one more song";
    }
    return "Select at least two songs";
  }

  void _select(int index, bool isSelected) {
    setState(() {
      _selections[index] = isSelected;
      _amountSelectedSongs += isSelected ? 1 : -1;
    });
  }

  void _pickSongsAndGoToGame() {
    List<Song> songsToPlay = [];

    for (int index = 0; index < songlist.length; index++) {
      if (!_selections[index]) continue;

      songsToPlay.add(songlist[index]);
    }

    Navigator.pushNamed(context, '/game', arguments: songsToPlay);
  }

  @override
  Widget build(BuildContext context) {
    for (int index = 0; index < songlist.length; index++) {
      Song song = songlist[index];
      _selections.add(false);
      _songTiles.add(SongTile(
          song: song,
          isSelected: _selections[index],
          select: (bool isSelected) => _select(index, isSelected)));
    }

    return SpordleScaffold(
        pageTitleText: "Select your songs to start",
        content: Column(children: [
          Expanded(
              child:
                  SingleChildScrollView(child: Column(children: _songTiles))),
          Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: RoundRectangularButton(
                  labelText: _getButtonText(),
                  isActive: _amountSelectedSongs > 1,
                  onPressAction: _pickSongsAndGoToGame))
        ]));
  }
}
