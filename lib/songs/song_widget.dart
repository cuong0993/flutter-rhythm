import 'package:flutter/material.dart';

import 'song.dart';

class SongWidget extends StatelessWidget {
  const SongWidget({
    required this.onTap,
    required this.song,
    Key? key,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final Song song;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        title: Text(
          song.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: song.artist.isNotEmpty
            ? Text(
                song.artist,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              )
            : null,
      );
}
