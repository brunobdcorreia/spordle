import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/playlist_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/constants/playlists.dart';
import 'package:spordle/constants/songs.dart';

class SelectPlaylistPage extends StatefulWidget {
  const SelectPlaylistPage({Key? key}) : super(key: key);

  @override
  _SelectPlaylistPageState createState() => _SelectPlaylistPageState();
}

class _SelectPlaylistPageState extends State<SelectPlaylistPage> {
  int _selectedPlaylistIndex = -1; // -1 indicates no selection
  final List<Widget> _playlistTiles = [];

  @override
  Widget build(BuildContext context) {
    _playlistTiles.clear(); // Clear the list to avoid duplicates
    for (int index = 0; index < playlistList.length; index++) {
      Playlist playlist = playlistList[index];
      _playlistTiles.add(PlaylistTile(
          playlist: playlist,
          isSelected: _selectedPlaylistIndex == index,
          select: (bool isSelected) => _select(index)));
    }

    return SpordleScaffold(
        pageTitleText: "Select your playlist to start",
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
                  isActive: _selectedPlaylistIndex != -1,
                  onPressAction: _pickPlaylistAndGoToGame))
        ]));
  }

  String _getButtonText() {
    if (_selectedPlaylistIndex != -1) {
      return "Play with selected playlist";
    } else {
      return "Select a playlist";
    }
  }

  void _select(int index) {
    setState(() {
      if (_selectedPlaylistIndex == index) {
        _selectedPlaylistIndex = -1; // Deselect if the same playlist is clicked
      } else {
        _selectedPlaylistIndex = index; // Select the new playlist
      }
    });
  }

  void _pickPlaylistAndGoToGame() {
    if (_selectedPlaylistIndex != -1) {
      List<Song> songsToPlay = [];

      for (int index = 0;
          index < playlistList[_selectedPlaylistIndex].songs.length;
          index++) {
        songsToPlay.add(playlistList[_selectedPlaylistIndex].songs[index]);
      }

      Navigator.pushNamed(context, '/game', arguments: songsToPlay);
    }
  }
}
