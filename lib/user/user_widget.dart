import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import '../generated/l10n.dart';
import '../loading_widget.dart';
import '../util.dart';
import 'user_bloc.dart';

class UserWidget extends StatelessWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: Text(S.of(context).txt_page_title_account, style: Theme.of(context)
                .appBarTheme
                .textTheme
                .headline5)),
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
                            children: <Widget>[buildColumn(state, context)])));
              } else {
                return Container();
              }
            }()));
      },
    );
  }

  Column buildColumn(UserUpdated state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        () {
          if (!state.user.isAnonymous) {
            return Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: CachedNetworkImage(
                              width: 72,
                              height: 72,
                              imageUrl: state.user.photoUrl,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              memCacheWidth: 72.toPixel(),
                              memCacheHeight: 72.toPixel()),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.user.name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.today,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  S.of(context).txt_joined(DateFormat.yMMMd()
                                      .format(state.user.creationTime)),
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/img_guitar.png'),
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(width: 8),
                                Text(S.of(context).txt_using(Intl.message(
                                      '',
                                      /* FIXME Localization name of instrument should be taken from server, not from local text resources */
                                      name: state.user.user.instrumentId,
                                      desc: '',
                                      args: [],
                                    ))),
                              ],
                            ),
                          ],
                        )
                      ],
                    )));
          } else {
            return Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                ..add(SignInWithGoogleEvent());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image(
                                      image: AssetImage(
                                          'assets/images/img_google.png')),
                                  SizedBox(width: 8),
                                  Text(S.of(context).txt_button_sign_in_google,
                                      style:
                                          Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                ..add(SignInWithFacebookEvent());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image(
                                      image: AssetImage(
                                          'assets/images/img_facebook.png')),
                                  SizedBox(width: 8),
                                  Text(
                                      S.of(context).txt_button_sign_in_facebook,
                                      style:
                                          Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                            ),
                          ),
                        ])));
          }
        }(),
        Card(
            color: Colors.transparent,
            elevation: 0,
            child: Table(
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
                          SizedBox(height: 8),
                          Image(
                            image: AssetImage('assets/images/img_star.png'),
                          ),
                          SizedBox(height: 8),
                          Text(state.user.user.stars.toString(),
                              style: Theme.of(context).textTheme.subtitle1),
                          SizedBox(height: 8),
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
                          SizedBox(height: 8),
                          Image(
                            image: AssetImage('assets/images/img_note.png'),
                          ),
                          SizedBox(height: 8),
                          Text(state.user.user.playedNotes.toString(),
                              style: Theme.of(context).textTheme.subtitle1),
                          SizedBox(height: 8),
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
                          SizedBox(height: 8),
                          Image(
                            image: AssetImage('assets/images/img_clock.png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                              state.user.user.playedTime
                                  .toString()
                                  .substring(0, 4)
                                  .toString(),
                              style: Theme.of(context).textTheme.subtitle1),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            )),
      ],
    );
  }
}
