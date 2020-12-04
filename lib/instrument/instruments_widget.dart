import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';
import '../loading_widget.dart';
import '../user/user_bloc.dart';

class InstrumentsWidget extends StatelessWidget {
  InstrumentsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Text(S.of(context).txt_instrument_title_instruments)),
          body: (() {
            if (state is UserLoading) {
              return LoadingWidget();
            } else if (state is UserUpdated) {
              final instruments = state.instruments;
              return ListView.builder(
                itemCount: instruments.length,
                itemBuilder: (context, index) {
                  final instrument = instruments[index];
                  return ListTile(
                      selected: state
                          .user.user.instrumentId == instrument.id,
                      selectedTileColor: Theme.of(context).colorScheme.onError,
                      onTap: () {
                        BlocProvider.of<UserBloc>(
                            context)
                            .add(ChangeInstrument(
                            instrument.id));
                      },
                      title: Text(Intl.message(
                        '',
                        /* FIXME Localization name of instrument should be taken from server, not from local text resources */
                        name: instrument.id,
                        desc: '',
                        args: [],
                      )));
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
