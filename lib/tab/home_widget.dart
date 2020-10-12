import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/songs/songs_widget.dart';

import 'bloc.dart';
import 'event.dart';
import 'state.dart';
import 'tab_widget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(activeTab.toString()),
            actions: [
              //FilterButton(visible: activeTab == AppTab.songs),
              //ExtraActions(),
            ],
          ),
          body: activeTab == TabState.songs ? SongsWidget() : SongsWidget(),
          bottomNavigationBar: TabWidget(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}