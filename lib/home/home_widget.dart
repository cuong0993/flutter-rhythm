import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../extra_actions.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../routes.dart';
import '../search/search_widget.dart';
import '../songs/songs_widget.dart';
import '../util.dart';
import 'home_bloc.dart';
import 'home_state.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: DefaultTabController(
            length: songTags.length,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                      title: Text(S.of(context).txt_all_songs,
                          style: Theme.of(context)
                              .appBarTheme
                              .textTheme
                              .headline5),
                      elevation: 2,
                      floating: true,
                      pinned: true,
                      snap: true,
                      forceElevated: true,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.search_rounded),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: SearchWidget());
                          },
                        ),
                        IconButton(
                            icon: Image(
                              image: AssetImage('assets/images/img_guitar.png'),
                              color:
                                  Theme.of(context).appBarTheme.iconTheme.color,
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, Routes.instrument);
                            }),
                        IconButton(
                            icon: ClipOval(
                              child: (state is HomeUpdated &&
                                      !state.user.isAnonymous)
                                  ? CachedNetworkImage(
                                      imageUrl: state.user.photoUrl,
                                      placeholder: (context, url) =>
                                          Icon(Icons.account_circle_rounded),
                                      memCacheWidth: 24.toPixel(),
                                      memCacheHeight: 24.toPixel())
                                  : Icon(Icons.account_circle_rounded),
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, Routes.account);
                            }),
                        ExtraActions()
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        tabs: songTags
                            .map((tabName) => Tab(
                                  text: Intl.message(
                                    '',
                                    /* FIXME Localization name of instrument should be taken from server, not from local text resources */
                                    name: tabName,
                                    desc: '',
                                    args: [],
                                  ),
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
