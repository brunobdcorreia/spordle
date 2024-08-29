import 'songs.dart';
import 'dart:math';

class Playlist {
  String title;
  List<Song> songs;
  String pictureFilePath;

  Playlist(this.title, this.songs, this.pictureFilePath);
}

List<Playlist> playlistList = [
  Playlist(
      'Dor e Sofrimento',
      []
        ..addAll(songlist)
        ..shuffle(Random()),
      "assets/gutsaka.jpg"),
  Playlist(
      'Sofrimento e Dor',
      []
        ..addAll(songlist)
        ..shuffle(Random()),
      "assets/gutsaka.jpg"),
];
