import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

import '../generated/l10n.dart';
import '../routes.dart';
import 'locale_widget.dart';
import 'setting_bloc.dart';

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Settings',
                style: Theme.of(context).appBarTheme.textTheme.headline5)),
        body: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return ListView(
              children: [
                ListTile(
                  title: Text(
                    S.of(context).txt_language,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                      map[Localizations.localeOf(context).languageCode],
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.language);
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).txt_theme,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                      Intl.message(
                        '',
                        name: state.themeMode.toString().split('.').last,
                        desc: '',
                        args: [],
                      ),
                      style: Theme.of(context).textTheme.subtitle1),
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.theme);
                  },
                ),
                ListTile(
                  title: Text(
                    S.of(context).txt_button_feedback,
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
                      S.of(context).txt_about_rate,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onTap: () async {
                      final _inAppReview = InAppReview.instance;
                      await _inAppReview.openStoreListing(
                        appStoreId: '_appStoreId',
                        microsoftStoreId: '_microsoftStoreId',
                      );
                    }),
                ListTile(
                    title: Text(
                      S.of(context).txt_about_invite,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onTap: () async {
                      // FIXME Trick to create uriPrefix
                      final uriPrefix =
                          'https://${Firebase.app().options.projectId.replaceAll('-', '')}.page.link';
                      final parameters = DynamicLinkParameters(
                        uriPrefix: uriPrefix,
                        link: Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.chaomao.hittick'),
                        androidParameters: AndroidParameters(
                          packageName: 'com.chaomao.hittick',
                          minimumVersion: 0,
                        ),
                        dynamicLinkParametersOptions:
                            DynamicLinkParametersOptions(
                          shortDynamicLinkPathLength:
                              ShortDynamicLinkPathLength.short,
                        ),
                        iosParameters: IosParameters(
                          // FIXME
                          bundleId:
                              'com.google.FirebaseCppDynamicLinksTestApp.dev',
                          minimumVersion: '0',
                        ),
                      );
                      final shortLink = await parameters.buildShortLink();
                      final url = shortLink.shortUrl;
                      await Share.share(
                          S.of(context).txt_invite_description(url),
                          subject:
                              S.of(context).txt_dynamic_link_invite_subject);
                    }),
              ],
            );
          },
        ));
  }
}
