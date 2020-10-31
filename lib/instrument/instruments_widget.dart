import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'instrument.dart';
import 'instruments_bloc.dart';
import 'instruments_state.dart';

class InstrumentsWidget extends StatelessWidget {
  InstrumentsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentsBloc, InstrumentsState>(
      builder: (context, state) {
        if (state is InstrumentsLoading) {
          return Container();
        } else if (state is InstrumentsLoaded) {
          final instruments = state.instruments;
          return DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
            },
            items: instruments
                .map<DropdownMenuItem<String>>((Instrument instrument) {
              return DropdownMenuItem<String>(
                value: instrument.id,
                child:  Text(Intl.message(
                  '',
                  /* FIXME Localization name of instrument should be taken from server, not from local text resources */
                  name: instrument.id,
                  desc: '',
                  args: [],
                )),
              );
            }).toList(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
