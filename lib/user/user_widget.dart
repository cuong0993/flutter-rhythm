import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
        final numberFormat = NumberFormat('#0.0#', 'en_US');
        return Scaffold(
            appBar: AppBar(title: Text(S.of(context).txt_page_title_about)),
            body: (() {
              if (state is UserInitial) {
                return LoadingWidget();
              } else if (state is UserUpdated) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: ScrollController(),
                        child: ListView(shrinkWrap: true, children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              () {
                                if (state.user.photoUrl.isNotEmpty) {
                                  return Card(
                                      child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(height: 8),
                                              ClipOval(
                                                child: (state.user.photoUrl
                                                        .isNotEmpty)
                                                    ? CachedNetworkImage(
                                                        imageUrl:
                                                            state.user.photoUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            Icon(Icons
                                                                .account_circle_rounded),
                                                        memCacheWidth: size24dp,
                                                        memCacheHeight:
                                                            size24dp)
                                                    : Icon(Icons
                                                        .account_circle_rounded),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                state.user.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5,
                                              ),
                                              SizedBox(height: 8),
                                            ],
                                          )));
                                } else {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                              Card(
                                  child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              S
                                                  .of(context)
                                                  .txt_instrument_title_instruments,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            DropdownButton<String>(
                                              value:
                                                  state.user.user.instrumentId,
                                              icon: Icon(Icons.arrow_drop_down),
                                              onChanged: (String newValue) {
                                                BlocProvider.of<UserBloc>(
                                                        context)
                                                    .add(ChangeInstrument(
                                                        newValue));
                                              },
                                              items: state.instruments.map<
                                                      DropdownMenuItem<String>>(
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
                                            )
                                          ]))),
                              Card(
                                  child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 8),
                                          CircularPercentIndicator(
                                            radius: 56.0,
                                            lineWidth: 4.0,
                                            animation: true,
                                            percent:
                                                state.user.user.experience /
                                                    state.user.user
                                                        .maxLevelExperience,
                                            center: Text(
                                                '${numberFormat.format((state.user.user.experience * 100.0 / state.user.user.maxLevelExperience))} %',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor: Colors.purple,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                              '${S.of(context).txt_level} ${state.user.user.level}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6)
                                        ],
                                      ))),
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
