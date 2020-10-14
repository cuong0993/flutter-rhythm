import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tab_bloc.dart';
import 'tab_event.dart';
import 'tab_state.dart';
import 'tab_widget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(title: Text(activeTab.name.tr())),
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
