import 'package:just_audio/just_audio.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'package:spordle/constants/songs.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Song? song;
  String _guess = '';
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _playRandomSegment();
  }

  Song _selectRandomSong(List<Song> songlist) {
    Random random = Random();
    int randomIndex = random.nextInt(songlist.length);

    return songlist[randomIndex];
  }

  void _playRandomSegment() async {
    song = _selectRandomSong(songlist);
    print(song!.title);

    assetsAudioPlayer.open(
      Audio.file(song!.songFilePath),
    );
    assetsAudioPlayer.setVolume(0.5);
    assetsAudioPlayer.play();

    await Future.delayed(const Duration(seconds: 10));
    assetsAudioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    final List<Song> songlist =
        ModalRoute.of(context)?.settings.arguments as List<Song>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Page'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Guess the name of the song by typing below'),
          ),
          DropdownMenu<String>(
            initialSelection:
                'Select a song', // Set the initial value of the dropdown
            dropdownMenuEntries: songlist.map((Song song) {
              return DropdownMenuEntry<String>(
                value: song.title,
                label: song.title,
              );
            }).toList(),
            onSelected: (String? newValue) {
              setState(() {
                _guess = newValue!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_guess == song!.title) {}
            },
            child: const Text('Guess'),
          ),
        ],
      ),
    );
  }
}
