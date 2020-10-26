import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'level_up_dialog.dart';
import 'tab_bloc.dart';
import 'tab_event.dart';
import 'tab_state.dart';
import 'tab_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    BlocProvider.of<TabBloc>(context).userUpLevelStream.listen((event) {
      showDialog<void>(
        context: context,
        builder: (_) => LevelUpDialog(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false, title: Text(activeTab.getName(context))),
          body: activeTab.widget,
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
