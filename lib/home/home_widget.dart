import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';
import '../routes.dart';
import '../search/search_widget.dart';
import '../songs/songs_widget.dart';
import '../user/user_bloc.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: DefaultTabController(
            length: songTags.length,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                      title: Text(AppLocalizations.of(context)!.txt_all_songs,
                          style: Theme.of(context)
                              .appBarTheme
                              .textTheme!
                              .headline5),
                      elevation: 2,
                      floating: true,
                      pinned: true,
                      snap: true,
                      forceElevated: true,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.search_rounded),
                          onPressed: () {
                            showSearch<void>(
                                context: context, delegate: SearchWidget());
                          },
                        ),
                        IconButton(
                            icon: Image(
                              image: const AssetImage(
                                  'assets/images/img_guitar.png'),
                              color: Theme.of(context)
                                  .appBarTheme
                                  .iconTheme!
                                  .color,
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, Routes.instrument);
                            }),
                        IconButton(
                            icon: ClipOval(
                              child: (state is UserUpdated &&
                                      !state.user.isAnonymous)
                                  ? Image.network(state.user.photoUrl)
                                  : const Icon(Icons.account_circle_rounded),
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, Routes.account);
                            }),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () async {
                            await Navigator.pushNamed(context, Routes.setting);
                          },
                        ),
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        tabs: songTags
                            .map((tabName) => Tab(
                                  text: getSongTagName(context, tabName),
                                ))
                            .toList(),
                      )),
                ];
              },
              body: TabBarView(
                children: songTags
                    .asMap()
                    .map((index, tabName) =>
                        MapEntry(index, SongsWidget(tagNumber: index)))
                    .values
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
