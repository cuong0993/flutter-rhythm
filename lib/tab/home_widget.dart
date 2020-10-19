import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // widget.notificationStream.listen((CurrencyNotification data) {
    //   if (data is NotificationOfIncrease) {
    //     Scaffold.of(context).showSnackBar(
    //       SnackBar(
    //         duration: Duration(seconds: 1),
    //         content: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text('Earned Currency'),
    //           ],
    //         ),
    //       ),
    //     );
    //   }
    // });
    BlocProvider.of<TabBloc>(context).loginRewardStream.listen((event) {
      print('aaaaaaaaaaaaaaaaaaaa');
      print(event.toString());
    });
    super.initState();
  }

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
