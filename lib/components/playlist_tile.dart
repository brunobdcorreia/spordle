import 'package:flutter/material.dart';
import 'package:spordle/constants/playlists.dart';
import 'package:spordle/constants/songs.dart';
import 'package:spordle/constants/spordle_borders.dart';

class PlaylistTile extends StatefulWidget {
  final Playlist playlist;
  final bool isSelected;
  final bool? isPlaying;
  final Function(bool) select;

  const PlaylistTile(
      {super.key,
      required this.playlist,
      required this.isSelected,
      this.isPlaying,
      required this.select});

  @override
  State<StatefulWidget> createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _switch() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.select(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    Map colors = _isSelected
        ? {
            "background": Theme.of(context).colorScheme.primary,
            "boldText": Theme.of(context).colorScheme.onPrimary,
            "semiBoldText": Theme.of(context).colorScheme.onSecondary,
            "lightText": Theme.of(context).colorScheme.onTertiary,
          }
        : {
            "background": Theme.of(context).colorScheme.surfaceDim,
            "boldText": Theme.of(context).colorScheme.primary,
            "semiBoldText": Theme.of(context).colorScheme.secondary,
            "lightText": Theme.of(context).colorScheme.tertiary,
          };

    TextStyle boldTextStyle = TextStyle(
        color: colors["boldText"], fontSize: 18, fontWeight: FontWeight.bold);

    TextStyle semiBoldTextStyle = TextStyle(
        color: colors["semiBoldText"],
        fontSize: 18,
        fontWeight: FontWeight.w500);

    TextStyle lightTextStyle = TextStyle(
        color: colors["lightText"], fontSize: 16, fontWeight: FontWeight.w300);

    return GestureDetector(
        onTap: _switch,
        child: Stack(children: [
          Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                color: colors["background"],
                borderRadius: SpordleBorders.tiltBorders,
              ),
              child: Row(children: [
                Image.asset(widget.playlist.playlistCoverImagePath,
                    fit: BoxFit.contain),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(widget.playlist.title, style: boldTextStyle),
                ),
              ])),
          widget.isPlaying != null
              ? Container(
                  height: MediaQuery.of(context).size.height /
                      6, // Same as song tile
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Icon(
                      widget.isPlaying! ? Icons.pause : Icons.play_arrow,
                      color: widget.isPlaying!
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      size: 60))
              : Container()
        ]));
  }
}
