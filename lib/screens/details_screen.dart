import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_state.dart';
import 'package:hitnotes/game/game.dart';

class GameScreen extends StatelessWidget {
  final String id;
  final MyGame game;

  GameScreen({Key key, @required this.id, @required this.game})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        return game.widget;
      },
    );
  }
}

void _handleTap(BuildContext context, TapDownDetails details) {}
