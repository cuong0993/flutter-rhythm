import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/filtered_songs/filtered_songs_bloc.dart';
import 'package:hitnotes/blocs/filtered_songs/filtered_songs_state.dart';
import 'package:hitnotes/widgets/song_item.dart';
import 'package:hitnotes/widgets/widgets.dart';

class FilteredSongs extends StatelessWidget {
  FilteredSongs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredSongsBloc, FilteredSongsState>(
      builder: (context, state) {
        if (state is FilteredSongsLoading) {
          return LoadingIndicator();
        } else if (state is FilteredSongsLoaded) {
          final songs = state.filteredSongs;
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongItem(
                song: song,
                onDismissed: (direction) {
                  // BlocProvider.of<SongsBloc>(context).add(DeleteSong(song));
                  // Scaffold.of(context).showSnackBar(DeleteSongSnackBar(
                  //   song: song,
                  //   onUndo: () =>
                  //       BlocProvider.of<SongsBloc>(context).add(AddSong(song)),
                  // ));
                },
                onTap: () async {
                  /*
                  final removedSong = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return DetailsScreen(id: song.id);
                    }),
                  );
                  if (removedSong != null) {
                    Scaffold.of(context).showSnackBar(
                      DeleteSongSnackBar(
                        song: song,
                        onUndo: () => BlocProvider.of<SongsBloc>(context)
                            .add(AddSong(song)),
                      ),
                    );
                  }
                */
                },
                onCheckboxChanged: (_) {
                  /*BlocProvider.of<SongsBloc>(context).add(
                    UpdateSong(song.copyWith(complete: !song.complete)),
                  );*/
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
