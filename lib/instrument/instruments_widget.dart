import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
import '../loading_widget.dart';
import 'instruments_bloc.dart';
import 'instruments_state.dart';

class InstrumentsWidget extends StatelessWidget {
  InstrumentsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentsBloc, InstrumentsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Text(S.of(context).txt_instrument_title_instruments)),
          body: (() {
            if (state is InstrumentsLoading) {
              return LoadingWidget();
            } else if (state is InstrumentsLoaded) {
              final instruments = state.instruments;
              // return ListView.builder(
              //   itemCount: instruments.length,
              //   itemBuilder: (context, index) {
              //     final instrument = instruments[index];
              //     return InstrumentWidget(
              //       instrument: instrument,
              //       onTap: () async {
              //         await Navigator.pushNamed(context, Routes.game,
              //             arguments: instrument);
              //       },
              //     );
              //   },
              // );
              return RotatedBox(
                  quarterTurns: 1,
                  child: ToggleButtons(
                children: (() {
                  return instruments
                      .map((instrument) => RotatedBox(quarterTurns: 3, child: Text('a')))
                      .toList();
                }()),
                onPressed: (int index) {
                  // setState(() {
                  //   for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  //     if (buttonIndex == index) {
                  //       isSelected[buttonIndex] = true;
                  //     } else {
                  //       isSelected[buttonIndex] = false;
                  //     }
                  //   }
                  // });
                },
                isSelected: [false, false, true],
              ));
            } else {
              return Container();
            }
          }()),
        );
      },
    );
  }
}
