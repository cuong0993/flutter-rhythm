import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/songs/songs_event.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'song_widget.dart';
import 'songs_bloc.dart';
import 'songs_state.dart';

class SongsWidget extends StatelessWidget {
  SongsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsLoading) {
          return LoadingWidget();
        } else if (state is SongsLoaded) {
          final songs = state.songs;
          final scrollController = ScrollController();
          scrollController.addListener(() {
            if (scrollController.offset >= scrollController.position.maxScrollExtent &&
                !scrollController.position.outOfRange) {
              print('enddddddd');
              BlocProvider.of<SongsBloc>(context).add(LoadMoreSongs());
            }
          });
          return ListView.builder(
            controller: scrollController,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongWidget(
                song: song,
                onTap: () async {
                  await Navigator.pushNamed(context, Routes.game,
                      arguments: song);
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
