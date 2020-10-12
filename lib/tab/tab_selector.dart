import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';
import 'state.dart';

class TabSelector extends StatelessWidget {
  final TabState activeTab;
  final Function(TabState) onTabSelected;

  TabSelector({
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
      items: TabState.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == TabState.songs
                ? Icons.library_music
                : MyFlutterApp.img_guitar,
          ),
          label: tab == TabState.stats ? 'Stats' : 'Songs',
        );
      }).toList(),
    );
  }
}
