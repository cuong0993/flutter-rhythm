import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../firebase_storage_cacher.dart';
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
      leading: CircleAvatar(
        backgroundImage: FileImage(File(song.imageUrl.toLocalFilePath())),
      ),
      title: Hero(
        tag: '${song.id}__heroTag',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            song.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
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
