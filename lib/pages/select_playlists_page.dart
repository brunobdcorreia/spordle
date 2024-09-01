import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/playlist_tile.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/song_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/constants/playlists.dart';
import 'package:spordle/constants/songs.dart';

class SelectPlaylistsPage extends StatefulWidget {
  const SelectPlaylistsPage({Key? key});

  @override
  State<SelectPlaylistsPage> createState() => _SelectPlaylistsPageState();
}

class _SelectPlaylistsPageState extends State<SelectPlaylistsPage> {
  int _amountSelectedPlaylists = 0;
  final List<Widget> _playlistTiles = [];
  final List<bool> _selections =
      List.generate(playlistlist.length, (index) => false);

  @override
  void initState() {
    super.initState();
    _initializePlaylistTiles();
  }

  void _initializePlaylistTiles() {
    for (int index = 0; index < playlistlist.length; index++) {
      Playlist playlist = playlistlist[index];
      _playlistTiles.add(PlaylistTile(
          playlist: playlist,
          isSelected: _selections[index],
          select: (bool isSelected) => _select(index, isSelected)));
    }
  }

  String _getButtonText() {
    if (_amountSelectedPlaylists >= 1) {
      return "Play with $_amountSelectedPlaylists playlists";
    }
    return "Select at least one playlist";
  }

  void _select(int index, bool isSelected) {
    setState(() {
      _selections[index] = isSelected;
      _amountSelectedPlaylists += isSelected ? 1 : -1;
    });
  }

  void _pickPlaylistsAndGoToGame() {
    List<Playlist> playlistsToPlay = [];

    for (int index = 0; index < playlistlist.length; index++) {
      if (!_selections[index]) continue;

      playlistsToPlay.add(playlistlist[index]);
    }

    Navigator.pushNamed(context, '/guess', arguments: playlistsToPlay);
  }

  @override
  Widget build(BuildContext context) {
    return SpordleScaffold(
        pageTitleText: "Select your playlists to start",
        content: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: _playlistTiles))),
          Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: RoundRectangularButton(
                  labelText: _getButtonText(),
                  isActive: _amountSelectedPlaylists >= 1,
                  onPressAction: _pickPlaylistsAndGoToGame))
        ]));
  }
}
