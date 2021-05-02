import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import 'instruments_model.dart';

class InstrumentsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final instrumentsState = watch(instrumentsStateProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.txt_instrument_title_instruments,
              style: Theme.of(context).appBarTheme.textTheme!.headline5)),
      body: () {
        if (instrumentsState.instruments.isNotEmpty) {
          return ListView.builder(
            itemCount: instrumentsState.instruments.length,
            itemBuilder: (context, index) {
              final instrument = instrumentsState.instruments[index];
              return RadioListTile<String>(
                title: Text(getInstrumentName(context, instrument.id),
                    style: Theme.of(context).textTheme.headline6),
                value: instrument.id,
                groupValue: instrumentsState.selectedInstrumentId,
                onChanged: (value) {
                  context
                      .read(instrumentsStateProvider.notifier)
                      .selectInstrument(value!);
                },
              );
            },
          );
        } else {
          return LoadingWidget();
        }
      }(),
    );
  }
}

String getInstrumentName(BuildContext context, String instrumentId) {
  switch (instrumentId) {
    case 'piano':
      return AppLocalizations.of(context)!.piano;
    case 'acoustic_guitar':
      return AppLocalizations.of(context)!.acoustic_guitar;
    case 'electric_guitar':
      return AppLocalizations.of(context)!.electric_guitar;
    default:
      return '';
  }
}
