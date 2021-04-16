import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import '../main.dart';
import '../user/user_model.dart';
import '../user/user_repository_impl.dart';
import '../user/user_state.dart';
import 'instruments_model.dart';
import 'instruments_state.dart';

class InstrumentsWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final instrumentsState = watch(instrumentsStateProvider);
    final userState = watch(userStateProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.txt_instrument_title_instruments,
              style: Theme.of(context).appBarTheme.textTheme!.headline5)),
      body: (() {
        if (instrumentsState is InstrumentsLoading) {
          return LoadingWidget();
        } else if (instrumentsState is InstrumentsUpdated) {
          if (userState is UserUpdated) {
            final instruments = instrumentsState.instruments;
            return ListView.builder(
              itemCount: instruments.length,
              itemBuilder: (context, index) {
                final instrument = instruments[index];
                return RadioListTile<String>(
                  title: Text(getInstrumentName(context, instrument.id),
                      style: Theme.of(context).textTheme.headline6),
                  value: instrument.id,
                  groupValue: userState.user.user.instrumentId,
                  onChanged: (value) {
                    context
                        .read(userRepositoryProvider)
                        .changeInstrument(value!);
                  },
                );
              },
            );
          } else {
            return LoadingWidget();
          }
        } else {
          return Container();
        }
      }()),
    );
  }
}
