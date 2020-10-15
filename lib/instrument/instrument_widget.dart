import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'instrument.dart';

class InstrumentWidget extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Instrument instrument;

  InstrumentWidget({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.instrument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__instrument_item_${instrument.id}'),
      onDismissed: onDismissed,
      child: ListTile(
          onTap: onTap,
          leading: Checkbox(
            value: true,
            onChanged: onCheckboxChanged,
          ),
          title: Hero(
            tag: '${instrument.id}',
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                instrument.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )),
    );
  }
}
