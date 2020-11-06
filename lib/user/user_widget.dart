import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import '../generated/l10n.dart';
import '../instrument/instruments_widget.dart';
import '../loading_widget.dart';
import 'user_bloc.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: Text(S.of(context).txt_page_title_about)),
            body: (() {
              if (state is UserInitial) {
                return LoadingWidget();
              } else if (state is UserUpdated) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InstrumentsWidget(),
                    RaisedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                          ..add(SignInWithGoogleEvent());
                      },
                      child: Text('G login'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                          ..add(SignInWithFacebookEvent());
                      },
                      child: Text('F login'),
                    ),
                    // Expanded(
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.max,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image(
                    //             image: AssetImage(
                    //                 'assets/images/img_firework.png')),
                    //         Text(
                    //           S
                    //               .of(context)
                    //               .txt_dialog_level_up_description('1'),
                    //           style: Theme.of(context).textTheme.headline6,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                );
              } else {
                return Container();
              }
            }()));
      },
    );
  }
}
