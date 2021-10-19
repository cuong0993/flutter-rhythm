import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info/package_info.dart';

import '../locale/locale_page.dart';
import '../router/router.dart';
import '../theme/theme_controller.dart';
import '../theme/theme_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context)!.txt_settings,
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                L10n.of(context)!.txt_language,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                localeStrings[Localizations.localeOf(context).languageCode]!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () => AutoRouter.of(context).push(const LocaleRoute()),
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.txt_theme,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Consumer(
                builder: (context, ref, child) {
                  final themeMode = ref.watch(themeModeProvider);
                  return Text(
                    getThemeName(context, themeMode),
                    style: Theme.of(context).textTheme.subtitle1,
                  );
                },
              ),
              onTap: () => AutoRouter.of(context).push(const ThemeRoute()),
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.txt_button_feedback,
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
                final email = Email(
                  body: extendedBody,
                  subject: '[$appName $version] Feedback',
                  recipients: ['chaomao.help@gmail.com'],
                );
                await FlutterEmailSender.send(email);
              },
            ),
            ListTile(
              title: Text(
                L10n.of(context)!.txt_about_rate,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () async {
                final _inAppReview = InAppReview.instance;
                await _inAppReview.openStoreListing(
                  appStoreId: '_appStoreId',
                  microsoftStoreId: '_microsoftStoreId',
                );
              },
            ),
          ],
        ),
      );
}
