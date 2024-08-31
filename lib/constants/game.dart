import 'package:spordle/constants/songs.dart';

class Game {
  final Song song;
  final num guesses;
  final bool hasGuessed;

  Game({required this.song, required this.guesses, required this.hasGuessed});

  @override
  String toString() {
    return 'Game{song: ${song.title}, guesses: $guesses, hasGuessed: $hasGuessed}';
  }
}

class History {
  final List<Game> games;

  History({required this.games});
}
