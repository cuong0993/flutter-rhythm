import 'package:flutter/foundation.dart';
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
        // final todo = (state as TodosLoaded)
        //     .todos
        //     .firstWhere((todo) => todo.id == id, orElse: () => null);
        return Scaffold(
          appBar: AppBar(
            title: Text('Todo Details'),
            actions: [
              IconButton(
                tooltip: 'Delete Todo',
                icon: Icon(Icons.delete),
                onPressed: () {
                  // BlocProvider.of<TodosBloc>(context).add(DeleteTodo(todo));
                  // Navigator.pop(context, todo);
                },
              )
            ],
          ),
          body: Listener()

        );
      },
    );
  }
}
