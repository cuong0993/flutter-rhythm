import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'preferences.dart';

class LogProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    Logger.root.info(
      '''
Add
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}''',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.root.info(
      '''
Update
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''',
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    Logger.root.info(
      '''
Dispose
{
  "provider": "${provider.name ?? provider.runtimeType}"
}''',
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  if (kReleaseMode) {
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: App(),
      ),
    );
  } else {
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    runApp(
      ProviderScope(
        observers: [LogProviderObserver()],
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: App(),
      ),
    );
  }
}
