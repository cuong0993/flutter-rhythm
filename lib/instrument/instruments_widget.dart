import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generated/l10n.dart';
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
        return Scaffold(
          appBar: AppBar(
              title: Text(S.of(context).txt_instrument_title_instruments)),
          body: (() {
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
                  );
                },
              );
            } else {
              return Container();
            }
          }()),
        );
      },
    );
  }
}
