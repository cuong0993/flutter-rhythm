import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../router/root_router.dart';
import '../songs/song.dart';
import '../songs/song_widget.dart';
import '../songs/songs_repository_impl.dart';

class SearchWidget extends SearchDelegate<void> {
  SearchWidget(this._read);

  final Reader _read;

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            query = '';
          },
        ),
      ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.light) {
      return super.appBarTheme(context);
    }

    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) => BackButton(
        onPressed: () {
          Navigator.pop(context);
        },
      );

  @override
  Widget buildResults(BuildContext context) => query.isEmpty
      ? const SizedBox.shrink()
      : FutureBuilder<List<Song>>(
          future: _read(songRepositoryProvider).searchSongs(query),
          builder: (context, recentList) {
            if (recentList.connectionState == ConnectionState.done) {
              final songs = recentList.requireData;

              return ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];

                  return SongWidget(
                    song: song,
                    onTap: () => AutoRouter.of(context)
                        .push(GameConfigRoute(song: song)),
                  );
                },
              );
            } else {
              return const LoadingWidget();
            }
          },
        );

  @override
  Widget buildSuggestions(BuildContext context) => const LoadingWidget();
}
