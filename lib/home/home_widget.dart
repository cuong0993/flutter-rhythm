import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extra_actions.dart';
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
var _photoUrl = '';

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    BlocProvider.of<TabBloc>(context).userUpLevelStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => LevelUpDialog(),
      );
    });
    BlocProvider.of<TabBloc>(context).showRateEventStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => RateDialog(),
      );
    });
    FirebaseAuth.instance.currentUser.providerData.forEach((userInfo) {
      if (userInfo.providerId == 'facebook.com') {
        _photoUrl = '${userInfo.photoURL}?height=$size96dp';
      } else if (userInfo.providerId == 'google.com') {
        _photoUrl = userInfo.photoURL.replaceAll('s96-c', 's$size96dp-c');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
              actions: [ClipOval(
                child: CachedNetworkImage(
                    imageUrl: _photoUrl,
                    placeholder: (context, url) => Icon(Icons.account_circle_rounded),
                    memCacheWidth: size24dp,
                    memCacheHeight: size24dp),
              ), ExtraActions()],
              automaticallyImplyLeading: false,
              title: Text('Hit Notes')),
          body: SongsWidget(),
        );
      },
    );
  }
}
