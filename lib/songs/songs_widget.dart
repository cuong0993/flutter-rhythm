import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../router/root_router.dart';
import 'song_widget.dart';
import 'songs_controller.dart';

class SongsWidget extends ConsumerWidget {
  const SongsWidget({
    required String tag,
    Key? key,
  })  : _tag = tag,
        super(key: key);

  final String _tag;

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
                    ref.read(songsByTagProvider(_tag).notifier).loadMoreSongs();
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
                          .push(GameConfigRoute(song: song)),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 4,
                  ),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isLoadingNextPage =
                  ref.watch(isLoadingNextPageByTagProvider(_tag).state).state;

              return isLoadingNextPage
                  ? const Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      loading: () => const LoadingWidget(),
      error: (_, __) => const LoadingWidget(),
    );
  }
}
