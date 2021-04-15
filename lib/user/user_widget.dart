import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import '../loading_widget.dart';
import '../main.dart';
import 'user_bloc.dart';
import 'user_state.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    AppLocalizations.of(context)!.txt_page_title_account,
                    style: Theme.of(context).appBarTheme.textTheme!.headline5)),
            body: (() {
              if (state is UserLoading) {
                return LoadingWidget();
              } else if (state is UserUpdated) {
                final scrollController = ScrollController();
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: scrollController,
                        child: ListView(
                            shrinkWrap: true,
                            controller: scrollController,
                            children: <Widget>[buildUI(state, context)])));
              } else {
                return Container();
              }
            }()));
      },
    );
  }

  Widget buildUI(UserUpdated state, BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          () {
            if (!state.user.isAnonymous) {
              return buildAnonymousUI(state, context);
            } else {
              return buildUserUI(context);
            }
          }(),
          Card(
              color: Colors.transparent,
              elevation: 0,
              child: buildUserStatisticUI(state, context)),
        ],
      ),
    );
  }

  Table buildUserStatisticUI(UserUpdated state, BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Container(
              //color: Colors.white,
              //width: 200,
              //height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Image(
                    image: AssetImage('assets/images/img_star.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(state.user.user.stars.toString(),
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Container(
              //color: Colors.white,
              // width: 200,
              //height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Image(
                    image: AssetImage('assets/images/img_note.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(state.user.user.playedNotes.toString(),
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Container(
              //color: Colors.white,
              //width: 200,
              //height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Image(
                    image: AssetImage('assets/images/img_clock.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      state.user.user.playedTime
                          .toString()
                          .substring(0, 4)
                          .toString(),
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Card buildUserUI(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(SignInWithGoogleEvent());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/img_google.png')),
                          const SizedBox(width: 8),
                          Text(
                              AppLocalizations.of(context)!
                                  .txt_button_sign_in_google,
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(SignInWithFacebookEvent());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                              image:
                                  AssetImage('assets/images/img_facebook.png')),
                          const SizedBox(width: 8),
                          Text(
                              AppLocalizations.of(context)!
                                  .txt_button_sign_in_facebook,
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  ),
                ])));
  }

  Card buildAnonymousUI(UserUpdated state, BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.network(state.user.photoUrl, width: 72),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.today,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          sprintf(AppLocalizations.of(context)!.txt_joined, [
                            DateFormat.yMMMd().format(state.user.creationTime)
                          ]),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/img_guitar.png'),
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(sprintf(AppLocalizations.of(context)!.txt_using, [
                          getInstrumentName(
                              context, state.user.user.instrumentId)
                        ])),
                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}
