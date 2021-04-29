import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

import '../authentication/authentication_widget.dart';
import '../instrument/instruments_widget.dart';
import '../loading_widget.dart';
import 'user_model.dart';
import 'user_state.dart';

class UserWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userState = watch(userStateProvider);
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.txt_page_title_account,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: (() {
          if (userState is UserLoading) {
            return LoadingWidget();
          } else if (userState is UserUpdated) {
            final scrollController = ScrollController();
            return Padding(
                padding: const EdgeInsets.all(8),
                child: Scrollbar(
                    isAlwaysShown: true,
                    controller: scrollController,
                    child: ListView(
                        shrinkWrap: true,
                        controller: scrollController,
                        children: <Widget>[_buildUI(userState, context)])));
          } else {
            return Container();
          }
        }()));
  }

  Widget _buildUI(UserUpdated state, BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          () {
            if (!state.user.isAnonymous) {
              return _buildAnonymousUI(state, context);
            } else {
              return const AuthenticationWidget();
            }
          }(),
          Card(
              color: Colors.transparent,
              elevation: 0,
              child: _buildUserStatisticUI(state, context)),
        ],
      ),
    );
  }

  Table _buildUserStatisticUI(UserUpdated state, BuildContext context) {
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

  Card _buildAnonymousUI(UserUpdated state, BuildContext context) {
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
