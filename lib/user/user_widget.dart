import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            appBar: AppBar(title: Text(S.of(context).txt_page_title_account)),
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
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  () {
                                    if (!state.user.isAnonymous) {
                                      return Card(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  ClipOval(
                                                    child: CachedNetworkImage(
                                                        width: 72,
                                                        height: 72,
                                                        imageUrl:
                                                            state.user.photoUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        memCacheWidth:
                                                            72.toPixel(),
                                                        memCacheHeight:
                                                            72.toPixel()),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    state.user.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6,
                                                  ),
                                                ],
                                              )));
                                    } else {
                                      return Card(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                AuthenticationBloc>(
                                                            context)
                                                          ..add(
                                                              SignInWithGoogleEvent());
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Image(
                                                                image: AssetImage(
                                                                    'assets/images/img_google.png')),
                                                            SizedBox(width: 8),
                                                            Text(
                                                              S
                                                                    .of(context)
                                                                    .txt_button_sign_in_google,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .subtitle1)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                AuthenticationBloc>(
                                                            context)
                                                          ..add(
                                                              SignInWithFacebookEvent());
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Image(
                                                                image: AssetImage(
                                                                    'assets/images/img_facebook.png')),
                                                            SizedBox(width: 8),
                                                            Text(
                                                                S
                                                                    .of(context)
                                                                    .txt_button_sign_in_facebook,
                                                                style: Theme
                                                                    .of(context)
                                                                    .textTheme
                                                                    .subtitle1
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ])));
                                    }
                                  }(),
                     Card(
                child:Table(
                                    defaultColumnWidth: FixedColumnWidth(120.0),
                                    // border: TableBorder.all(
                                    //     color: Colors.black,
                                    //     style: BorderStyle.solid,
                                    //     width: 2),
                                    children: [
                                      TableRow(children: [Text('Website'),
                                        Text('Website'),
                                      ]),
                                      TableRow(children: [Text('Website'),
                                        Text('Website'),
                                      ]),
                                    ],)),
                                ],
                              )
                            ])));
              } else {
                return Container();
              }
            }()));
      },
    );
  }
}
