import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'song_widget.dart';
import 'songs_model.dart';
import 'songs_state.dart';

class SongsWidget extends ConsumerWidget {
  final int tagNumber;

  SongsWidget({Key? key, required int tagNumber})
      : tagNumber = tagNumber,
        super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final songs = watch(songsProvider);
    if (songs is SongsStateLoading) {
      return LoadingWidget();
    } else if (songs is SongsStateLoaded) {
      final songsByTag = songs.songsByTags[tagNumber];
      return Scrollbar(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels > 0 &&
                notification.metrics.atEdge) {
              context
                  .read(songsProvider.notifier)
                  .loadMoreSongsByTagNumbers([tagNumber]);
            }
            return true;
          },
          child: ListView.separated(
            itemCount: (songs.isLoadingMoreByTags[tagNumber])
                ? songsByTag.length + 1
                : songsByTag.length,
            itemBuilder: (context, index) {
              if (index == songsByTag.length) {
                return const Center(
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              final song = songsByTag[index];
              return SongWidget(
                song: song,
                onTap: () async {
                  await Navigator.pushNamed(context, Routes.gameConfig,
                      arguments: song);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 4,
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
