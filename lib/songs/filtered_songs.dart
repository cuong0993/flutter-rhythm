import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/game/screen.dart';

import '../loading_indicator.dart';
import 'bloc.dart';
import 'item.dart';
import 'state.dart';

class FilteredSongs extends StatelessWidget {
  FilteredSongs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsLoading) {
          return LoadingIndicator();
        } else if (state is SongsLoaded) {
          final songs = state.songs;
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongItem(
                song: song,
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return GameScreen(song: song);
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
