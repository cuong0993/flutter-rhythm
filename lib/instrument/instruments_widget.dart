import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_widget.dart';
import '../routes.dart';
import 'instrument_widget.dart';
import 'instruments_bloc.dart';
import 'instruments_state.dart';

class InstrumentsWidget extends StatelessWidget {
  InstrumentsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentsBloc, InstrumentsState>(
      builder: (context, state) {
        if (state is InstrumentsLoading) {
          return LoadingWidget();
        } else if (state is InstrumentsLoaded) {
          final instruments = state.instruments;
          return ListView.builder(
            itemCount: instruments.length,
            itemBuilder: (context, index) {
              final instrument = instruments[index];
              return InstrumentWidget(
                instrument: instrument,
                onTap: () async {
                  await Navigator.pushNamed(context, Routes.game,
                      arguments: instrument);
                },
                onDismissed: (DismissDirection direction) {},
                onCheckboxChanged: (bool value) {},
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
