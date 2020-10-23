import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'tab_state.dart';

class TabWidget extends StatelessWidget {
  final TabState activeTab;
  final Function(TabState) onTabSelected;

  TabWidget({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: TabState.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(TabState.values[index]),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Theme.of(context).accentColor,
      selectedItemColor: Theme.of(context).buttonColor,
      unselectedItemColor: Theme.of(context).disabledColor,
      items: TabState.values.map((tab) {
        return BottomNavigationBarItem(
          icon: tab.icon,
          label: tab.name,
        );
      }).toList(),
    );
  }
}
