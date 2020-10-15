import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import 'user_bloc.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          BlocProvider.of<UserBloc>(context).add(LoadUser());
          return LoadingWidget();
        } else if (state is UserUpdated) {
          return Text(state.user.id);
        } else {
          return Container();
        }
      },
    );
  }
}
