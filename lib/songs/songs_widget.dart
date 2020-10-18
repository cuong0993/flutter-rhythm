import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'song_widget.dart';
import 'songs_bloc.dart';
import 'songs_event.dart';
import 'songs_state.dart';

class SongsWidget extends StatelessWidget {
  SongsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsInitial) {
          return LoadingWidget();
        } else if (state is SongsLoaded) {
          final songs = state.songs;
          final scrollController = ScrollController();
          scrollController.addListener(() {
            if (scrollController.offset >=
                    scrollController.position.maxScrollExtent &&
                !scrollController.position.outOfRange) {
              BlocProvider.of<SongsBloc>(context).add(LoadMoreSongs());
            }
          });
          return Scrollbar(
            isAlwaysShown: true,
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemCount:
                  (state.isLoadingMore) ? songs.length + 1 : songs.length,
              itemBuilder: (context, index) {
                if (index == songs.length) {
                  return Center(
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      height: 32,
                      width: 32,
                    ),
                  );
                }
                final song = songs[index];
                return SongWidget(
                  song: song,
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.game,
                        arguments: song);
                  },
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
