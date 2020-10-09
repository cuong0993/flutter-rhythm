import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<TabBloc, AppTab>(
    //   builder: (context, activeTab) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text(activeTab.toString()),
    //         actions: [
    //           //FilterButton(visible: activeTab == AppTab.songs),
    //           //ExtraActions(),
    //         ],
    //       ),
    //       body: activeTab == AppTab.songs ? FilteredSongs() : FilteredSongs(),
    //       bottomNavigationBar: TabSelector(
    //         activeTab: activeTab,
    //         onTabSelected: (tab) =>
    //             BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
    //       ),
    //     );
    //   },
    // );
  }
}