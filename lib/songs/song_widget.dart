import 'package:flutter/material.dart';

import 'song.dart';

class SongWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final Song song;

  SongWidget({
    Key key,
    @required this.onTap,
    @required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        song.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: song.artist.isNotEmpty
          ? Text(
              song.artist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            )
          : null,
    );
  }
}
