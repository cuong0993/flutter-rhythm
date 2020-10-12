import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/game/game_widget.dart';

import '../loading_widget.dart';
import 'bloc.dart';
import 'song_widget.dart';
import 'state.dart';

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
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongWidget(
                song: song,
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return GameWidget(song: song);
                    }),
                  );
                },
                onDismissed: (DismissDirection direction) {},
                onCheckboxChanged: (bool value) {},
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