import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager_firebase/flutter_cache_manager_firebase.dart';

import '../util.dart';
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
