import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../midi/midi_model.dart';
import '../router/router.dart';
import '../search/search_widget.dart';
import '../songs/songs_model.dart';
import '../songs/songs_widget.dart';
import '../user/user_model.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HookBuilder(builder: (context) {
      final tabController = useTabController(initialLength: songTags.length);
      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                title: Text(L10n.of(context)!.txt_all_songs,
                    style: Theme.of(context).appBarTheme.textTheme!.headline5),
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
                        image: const AssetImage('assets/images/img_guitar.png'),
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                      ),
                      onPressed: () => AutoRouter.of(context)
                          .push(const InstrumentsRoute())),
                  IconButton(
                      icon: ClipOval(child: Consumer(
                        builder: (context, watch, child) {
                          // FIXME To load midi
                          watch(midiProvider);
                          final user = watch(userProvider);
                          return user.when(
                              data: (user) => Image.network(
                                    user.photoUrl,
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                      return const Icon(
                                          Icons.account_circle_rounded);
                                    },
                                  ),
                              loading: () =>
                                  const Icon(Icons.account_circle_rounded),
                              error: (_, __) =>
                                  const Icon(Icons.account_circle_rounded));
                        },
                      )),
                      onPressed: () =>
                          AutoRouter.of(context).push(const UserRoute())),
                  IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () =>
                          AutoRouter.of(context).push(const SettingsRoute())),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  tabs: songTags
                      .map((tabName) => Tab(
                            text: getSongTagName(context, tabName),
                          ))
                      .toList(),
                )),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: songTags
              .asMap()
              .map((index, tabName) =>
                  MapEntry(index, SongsWidget(tag: tabName)))
              .values
              .toList(),
        ),
      );
    }));
  }
}

String getSongTagName(BuildContext context, String tabName) {
  switch (tabName) {
    case 'pop':
      return L10n.of(context)!.pop;
    case 'classic':
      return L10n.of(context)!.classic;
    case 'folk':
      return L10n.of(context)!.folk;
    case 'kpop':
      return L10n.of(context)!.kpop;
    case 'other':
      return L10n.of(context)!.other;
    default:
      return '';
  }
}
