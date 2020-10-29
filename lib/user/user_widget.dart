import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/images/img_firework.png')),
                      Text(
                        S.of(context).txt_dialog_level_up_description('1'),
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
