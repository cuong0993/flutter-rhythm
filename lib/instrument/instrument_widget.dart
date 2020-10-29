import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager_firebase/flutter_cache_manager_firebase.dart';
import 'package:intl/intl.dart';

import '../util.dart';
import 'instrument.dart';

class InstrumentWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final Instrument instrument;

  InstrumentWidget({
    Key key,
    @required this.onTap,
    @required this.instrument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: CachedNetworkImage(
            imageUrl: instrument.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            memCacheWidth: size40dp,
            memCacheHeight: size40dp,
            cacheManager: FirebaseCacheManager()),
        title: Text(
          Intl.message(
            '',
            /* FIXME Localization name of instrument should be taken from server, not from local text resources */
            name: instrument.id,
            desc: '',
            args: [],
          ),
          style: Theme.of(context).textTheme.headline6,
        ));
  }
}
