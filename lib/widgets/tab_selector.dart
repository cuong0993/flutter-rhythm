import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hitnotes/models/models.dart';

import '../my_flutter_app_icons.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Theme.of(context).accentColor,
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == AppTab.todos ? Icons.library_music : MyFlutterApp.img_guitar,
          ),
          title: Text(
            tab == AppTab.stats ? 'Stats' : 'Todos',
          ),
        );
      }).toList(),
    );
  }
}
