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
      leading: CachedNetworkImage(
          width: 40,
          height: 40,
          imageUrl: song.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          memCacheWidth: 40.toPixel(),
          memCacheHeight: 40.toPixel(),
          cacheManager: FirebaseCacheManager()),
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
