import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import '../routes.dart';
import '../songs/song.dart';
import '../songs/song_widget.dart';
import '../songs/songs_repository.dart';

class SearchWidget extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.light) return super.appBarTheme(context);
    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      final songsRepository = RepositoryProvider.of<SongsRepository>(context);
      return FutureBuilder<List<Song>>(
          future: songsRepository.searchSongs(query),
          builder: (context, recentList) {
            if (recentList.connectionState == ConnectionState.done) {
              final songs = recentList.requireData;
              return ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return SongWidget(
                    song: song,
                    onTap: () async {
                      await Navigator.pushNamed(context, Routes.gameConfig,
                          arguments: song);
                    },
                  );
                },
              );
            } else {
              return LoadingWidget();
            }
          });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: LoadingWidget(),
    );
  }
}
