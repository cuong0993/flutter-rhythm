import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'song_widget.dart';
import 'songs_bloc.dart';
import 'songs_event.dart';
import 'songs_state.dart';

class SongsWidget extends StatelessWidget {
  final int tagNumber;

  SongsWidget({Key? key, required int tagNumber})
      : tagNumber = tagNumber,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsInitial) {
          return LoadingWidget();
        } else if (state is SongsLoaded) {
          final songsByTag = state.songsByTags[tagNumber];
          return Scrollbar(
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels > 0 &&
                    notification.metrics.atEdge) {
                  BlocProvider.of<SongsBloc>(context)
                      .add(LoadMoreSongsByTagNumbers([tagNumber]));
                }
                return true;
              },
              child: ListView.separated(
                itemCount: (state.isLoadingMoreByTags[tagNumber])
                    ? songsByTag.length + 1
                    : songsByTag.length,
                itemBuilder: (context, index) {
                  if (index == songsByTag.length) {
                    return Center(
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  final song = songsByTag[index];
                  return SongWidget(
                    song: song,
                    onTap: () async {
                      await Navigator.pushNamed(context, Routes.gameConfig,
                          arguments: song);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 4,
                  );
                },
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
