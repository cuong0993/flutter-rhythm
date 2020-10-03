import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/models/song.dart';

class SongItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Song song;

  SongItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__song_item_${song.id}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: song.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${song.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              song.task,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        subtitle: song.note.isNotEmpty
            ? Text(
                song.note,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              )
            : null,
      ),
    );
  }
}
