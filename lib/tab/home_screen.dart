import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hitnotes/songs/filtered_songs.dart';

import 'app_tab.dart';
import 'tab_bloc.dart';
import 'tab_event.dart';
import 'tab_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(activeTab.toString()),
            actions: [
              //FilterButton(visible: activeTab == AppTab.songs),
              //ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.songs ? FilteredSongs() : FilteredSongs(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
