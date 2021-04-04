import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../loading_widget.dart';
import '../main.dart';
import '../user/user_bloc.dart';

class InstrumentsWidget extends StatelessWidget {
  InstrumentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                  AppLocalizations.of(context)!
                      .txt_instrument_title_instruments,
                  style: Theme.of(context).appBarTheme.textTheme!.headline5)),
          body: (() {
            if (state is UserLoading) {
              return LoadingWidget();
            } else if (state is UserUpdated) {
              final instruments = state.instruments;
              return ListView.builder(
                itemCount: instruments.length,
                itemBuilder: (context, index) {
                  final instrument = instruments[index];
                  return RadioListTile<String>(
                    title: Text(getInstrumentName(context, instrument.id),
                        style: Theme.of(context).textTheme.headline6),
                    value: instrument.id,
                    groupValue: state.user.user.instrumentId,
                    onChanged: (value) {
                      BlocProvider.of<UserBloc>(context)
                          .add(ChangeInstrument(value!));
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
