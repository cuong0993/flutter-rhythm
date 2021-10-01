import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

import '../authentication/authentication_widget.dart';
import '../instrument/instruments_page.dart';
import '../loading_widget.dart';
import 'user.dart';
import 'user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(L10n.of(context)!.txt_page_title_account,
                style: Theme.of(context).appBarTheme.toolbarTextStyle)),
        body: Consumer(builder: (context, ref, child) {
          final user = ref.watch(userProvider);
          return user.when(
              data: (user) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Scrollbar(
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                            child: _buildUI(user, context))));
              },
              loading: (_) => const LoadingWidget(),
              error: (_, __, ___) => const LoadingWidget());
        }));
  }

  Widget _buildUI(User user, BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          () {
            if (!user.anonymous) {
              return _buildUserDetailsUI(user, context);
            } else {
              return const AuthenticationWidget();
            }
          }(),
          Card(
              color: Colors.transparent,
              elevation: 0,
              child: _buildUserStatisticUI(user, context)),
        ],
      ),
    );
  }

  Table _buildUserStatisticUI(User user, BuildContext context) {
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
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Image(
                  image: AssetImage('assets/images/img_star.png'),
                ),
                const SizedBox(height: 8),
                Text(user.stars.toString(),
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 8),
              ],
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
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Image(
                  image: AssetImage('assets/images/img_note.png'),
                ),
                const SizedBox(height: 8),
                Text(user.playedNotes.toString(),
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 8),
              ],
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
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Image(
                  image: AssetImage('assets/images/img_clock.png'),
                ),
                const SizedBox(height: 8),
                Text(user.playedTime.toString().substring(0, 4).toString(),
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  Card _buildUserDetailsUI(User user, BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.network(user.photoUrl,
                      errorBuilder: (context, exception, stackTrace) {
                    return const Icon(
                      Icons.account_circle_rounded,
                      size: 72,
                    );
                  }, width: 72),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
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
                          sprintf(L10n.of(context)!.txt_joined,
                              [DateFormat.yMMMd().format(user.creationTime)]),
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
                        Text(sprintf(L10n.of(context)!.txt_using,
                            [getInstrumentName(context, user.instrumentId)])),
                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}
