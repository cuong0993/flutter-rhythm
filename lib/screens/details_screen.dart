import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_bloc.dart';
import 'package:hitnotes/blocs/songs/songs_state.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        return RawGestureDetector(
            gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
              MultiTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                      MultiTapGestureRecognizer>(
                  () => MultiTapGestureRecognizer(),
                  (MultiTapGestureRecognizer instance) {
                instance.onTapDown = (int pointer, TapDownDetails details) =>
                    _handleTap(context, details);
              })
            },
            child: Container());
      },
    );
  }
}

void _handleTap(BuildContext context, TapDownDetails details) {}
