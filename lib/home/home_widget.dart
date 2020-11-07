import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extra_actions.dart';
import '../generated/l10n.dart';
import '../routes.dart';
import '../search/search_widget.dart';
import '../songs/songs_widget.dart';
import '../util.dart';
import 'home_bloc.dart';
import 'home_state.dart';
import 'level_up_dialog.dart';
import 'rate_dialog.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).userUpLevelStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => LevelUpDialog(),
      );
    });
    BlocProvider.of<HomeBloc>(context).showRateEventStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => RateDialog(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchWidget());
                  },
                ),
                IconButton(
                    icon: ClipOval(
                      child: (state is HomeUpdated &&
                              state.user.photoUrl.isNotEmpty)
                          ? CachedNetworkImage(
                              imageUrl: state.user.photoUrl,
                              placeholder: (context, url) =>
                                  Icon(Icons.account_circle_rounded),
                              memCacheWidth: size24dp,
                              memCacheHeight: size24dp)
                          : Icon(Icons.account_circle_rounded),
                    ),
                    onPressed: () async {
                      await Navigator.pushNamed(context, Routes.account);
                    }),
                ExtraActions()
              ],
              automaticallyImplyLeading: false,
              title: Text(S.of(context).txt_all_songs)),
          body: SongsWidget(),
        );
      },
    );
  }
}
