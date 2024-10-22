import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:assets_audio_player/assets_audio_player.dart' as audio_player;
import 'package:spordle/components/guess_song_dropdown.dart';
import 'package:spordle/components/guess_song_lifebar.dart';
import 'package:spordle/components/round_rectangular_button.dart';
import 'package:spordle/components/song_tile.dart';
import 'package:spordle/components/spordle_scaffold.dart';
import 'dart:async';
import 'package:spordle/constants/game.dart';
import 'package:spordle/constants/playlists.dart' as sp_playlist;
import 'package:spordle/constants/songs.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<StatefulWidget> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  static const int _maxGuesses = 5;
  final audio_player.AssetsAudioPlayer _audioPlayer =
      audio_player.AssetsAudioPlayer();
  Song? song;
  List<Song> songlist = [];
  bool _isPlaying = true;
  bool _hasGuessed = false;
  bool _hasLost = false;
  int _guesses = 0;
  int _maxDuration = 10;
  Timer? _timer;

  // What happens when a user takes a guess
  void _onGuess(bool isCorrect) {
    if (!isCorrect) {
      setState(() {
        _guesses++;
        _maxDuration += 10;
        _audioPlayer.seek(const Duration(seconds: 0));
        _audioPlayer.pause();
        _isPlaying = false;
      });

      Fluttertoast.showToast(
          msg: "You have ${_maxGuesses - _guesses} guesses left.");
    }

    if (_guesses == _maxGuesses) {
      // Game over
      setState(() {
        _hasLost = true;
      });

      Fluttertoast.showToast(msg: "You've failed to guess the song!");
      _saveGameHistory();
    }

    if (isCorrect) {
      Fluttertoast.showToast(msg: "Correct answer!");
      setState(() {
        _guesses++;
        _hasGuessed = true;
      });

      _saveGameHistory();
    }
  }

  // Play the audio
  void _playOrPauseAudio(_) {
    _audioPlayer.playOrPause();
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  Future<void> _saveGameHistory() async {
    final Game game =
        Game(song: song!, guesses: _guesses, hasGuessed: _hasGuessed);

    final prefs = await SharedPreferences.getInstance();
    final List<String> games = prefs.getStringList('games') ?? [];
    games.add(game.toString());

    await prefs.setStringList('games', games);

    print(prefs.getStringList('games'));
  }

  Future<bool> didPopRoute() async {
    _audioPlayer.dispose();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final List<sp_playlist.Playlist> playlistlist = ModalRoute.of(context)
        ?.settings
        .arguments as List<sp_playlist.Playlist>;

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

    if (!_audioPlayer.current.hasValue) {
      print("Opening audio player");
      _audioPlayer.open(
        audio_player.Audio.file(song!.audioFilePath),
      );
      _audioPlayer.setVolume(0.5);
      _audioPlayer.play();
    }

    return SpordleScaffold(
        pageTitleText: "Guess the song",
        content: Column(children: [
          const Text("Tap the track to play it"),
          SongTile(
              song: _hasGuessed || _hasLost ? song! : mysterySong,
              isSelected: _isPlaying,
              select: _playOrPauseAudio,
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
        ]));
  }
}
