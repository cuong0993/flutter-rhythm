import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'song_widget.dart';
import 'songs_model.dart';

class SongsWidget extends ConsumerWidget {
  final String _tag;

  SongsWidget({Key? key, required String tag})
      : _tag = tag,
        super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final songsByTag = watch(songsByTagProvider(_tag));
    return songsByTag.when(
        data: (songsByTag) => Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels > 0 &&
                            notification.metrics.atEdge) {
                          context
                              .read(songsByTagProvider(_tag).notifier)
                              .loadMoreSongs();
                        }
                        return true;
                      },
                      child: ListView.separated(
                        itemCount: songsByTag.length,
                        itemBuilder: (context, index) {
                          final song = songsByTag[index];
                          return SongWidget(
                            song: song,
                            onTap: () async {
                              await Navigator.pushNamed(
                                  context, Routes.gameConfig,
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
                  ),
                ),
                Consumer(
                  builder: (context, watch, child) {
                    final isLoadingByTag =
                        watch(isLoadingNextPageByTagProvider(_tag)).state;
                    return isLoadingByTag
                        ? const Center(
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        : Container();
                  },
                )
              ],
            ),
        loading: () => LoadingWidget(),
        error: (_, __) => LoadingWidget());
  }
}
