import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import '../generated/l10n.dart';
import '../instrument/instrument.dart';
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
            appBar: AppBar(title: Text(S.of(context).txt_page_title_about)),
            body: (() {
              if (state is UserInitial) {
                return LoadingWidget();
              } else if (state is UserUpdated) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        () {
                          if (state.user.photoUrl.isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipOval(
                                  child: (state.user.photoUrl.isNotEmpty)
                                      ? CachedNetworkImage(
                                          imageUrl: state.user.photoUrl,
                                          placeholder: (context, url) => Icon(
                                              Icons.account_circle_rounded),
                                          memCacheWidth: size24dp,
                                          memCacheHeight: size24dp)
                                      : Icon(Icons.account_circle_rounded),
                                ),
                                Text(state.user.name,               style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            );
                          } else {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthenticationBloc>(
                                          context)
                                        ..add(SignInWithGoogleEvent());
                                    },
                                    child: Text('G login'),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      BlocProvider.of<AuthenticationBloc>(
                                          context)
                                        ..add(SignInWithFacebookEvent());
                                    },
                                    child: Text('F login'),
                                  ),
                                ]);
                          }
                        }(),
                        DropdownButton<String>(
                          value: state.user.user.instrumentId,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {},
                          items: state.instruments
                              .map<DropdownMenuItem<String>>(
                                  (Instrument instrument) {
                            return DropdownMenuItem<String>(
                              value: instrument.id,
                              child: Text(Intl.message(
                                '',
                                /* FIXME Localization name of instrument should be taken from server, not from local text resources */
                                name: instrument.id,
                                desc: '',
                                args: [],
                              )),
                            );
                          }).toList(),
                        ),
                        Expanded(child: LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.5,
                          center: Text(
                            '${state.user.user.experience} / ${state.user.user.maxLevelExperience}',
                          ),
                          leading: Icon(Icons.mood),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                        ),
                        ),
                      ],
                    ));
              } else {
                return Container();
              }
            }()));
      },
    );
  }
}
