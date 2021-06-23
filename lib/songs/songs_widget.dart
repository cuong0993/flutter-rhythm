import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../router/router.dart';
import 'song_widget.dart';
import 'songs_model.dart';

class SongsWidget extends ConsumerWidget {
  final String _tag;

  const SongsWidget({Key? key, required String tag})
      : _tag = tag,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsByTag = ref.watch(songsByTagProvider(_tag));
    return songsByTag.when(
        data: (songsByTag) => Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels > 0 &&
                            notification.metrics.atEdge) {
                          ref
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
                              onTap: () => AutoRouter.of(context)
                                  .push(GameConfigRoute(song: song)));
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
                  builder: (context, ref, child) {
                    final isLoadingByTag =
                        ref.watch(isLoadingNextPageByTagProvider(_tag)).state;
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
                        : const SizedBox.shrink();
                  },
                )
              ],
            ),
        loading: () => const LoadingWidget(),
        error: (_, __) => const LoadingWidget());
  }
}
