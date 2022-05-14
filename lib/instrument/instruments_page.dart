import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../loading_widget.dart';
import 'instruments_controller.dart';
import 'instruments_repository_impl.dart';

@RoutePage<dynamic>()
class InstrumentsPage extends ConsumerWidget {
  const InstrumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instruments = ref.watch(instrumentsProvider);
    final selectedInstrumentId =
        ref.watch(selectedInstrumentIdProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context)!.txt_instrument_title_instruments,
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
      ),
      body: instruments.when(
        data: (instruments) => ListView.builder(
          itemCount: instruments.length,
          itemBuilder: (context, index) {
            final instrument = instruments[index];

            return RadioListTile<String>(
              title: Text(
                getInstrumentName(context, instrument.id),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              value: instrument.id,
              groupValue: selectedInstrumentId,
              onChanged: (value) {
                ref
                    .watch(instrumentRepositoryProvider)
                    .changeInstrument(value!);
                ref.read(selectedInstrumentIdProvider.notifier).state = value;
              },
            );
          },
        ),
        loading: () => const LoadingWidget(),
        error: (_, __) => const LoadingWidget(),
      ),
    );
  }
}

String getInstrumentName(BuildContext context, String instrumentId) {
  switch (instrumentId) {
    case 'piano':
      return L10n.of(context)!.piano;
    case 'acoustic_guitar':
      return L10n.of(context)!.acoustic_guitar;
    case 'electric_guitar':
      return L10n.of(context)!.electric_guitar;
    default:
      return '';
  }
}
