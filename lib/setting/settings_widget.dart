import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mailto/mailto.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../routes.dart';
import 'locale_widget.dart';
import 'setting_bloc.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.txt_settings,
                style: Theme.of(context).appBarTheme.textTheme!.headline5)),
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return ListView(
              children: [
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.txt_language,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                      map[Localizations.localeOf(context).languageCode]!,
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.language);
                  },
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.txt_theme,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                      getThemeName(
                          context, state.themeMode ?? ThemeMode.system),
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.theme);
                  },
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.txt_button_feedback,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () async {
                    final packageInfo = await PackageInfo.fromPlatform();
                    final appName = packageInfo.appName;
                    final version = packageInfo.version;
                    final buildNumber = packageInfo.buildNumber;
                    var deviceInfo = '';
                    if (Platform.isAndroid) {
                      final info = await DeviceInfoPlugin().androidInfo;
                      final release = info.version.release;
                      final sdkInt = info.version.sdkInt;
                      final manufacturer = info.manufacturer;
                      final model = info.model;
                      deviceInfo =
                          'Android $release (SDK $sdkInt), $manufacturer $model';
                    }

                    if (Platform.isIOS) {
                      final info = await DeviceInfoPlugin().iosInfo;
                      final systemName = info.systemName;
                      final version = info.systemVersion;
                      final name = info.name;
                      final model = info.model;
                      deviceInfo = '$systemName $version, $name $model';
                    }
                    final extendedBody = 'Name: $appName\n'
                        'Version code: $buildNumber\n'
                        'Version name: $version\n'
                        'Device: $deviceInfo\n'
                        '---------------------\n';
                    final email = Mailto(
                      body: extendedBody,
                      subject: '[$appName $version] Feedback',
                      to: ['chaomao.help@gmail.com'],
                    );
                    await launch('$email');
                  },
                ),
                ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.txt_about_rate,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onTap: () async {
                      final _inAppReview = InAppReview.instance;
                      await _inAppReview.openStoreListing(
                        appStoreId: '_appStoreId',
                        microsoftStoreId: '_microsoftStoreId',
                      );
                    }),
              ],
            );
          },
        ));
  }
}
