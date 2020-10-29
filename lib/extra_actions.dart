import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

import 'generated/l10n.dart';

class ExtraActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExtraAction>(
      onSelected: (action) async {
        switch (action) {
          case ExtraAction.feedback:
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
            break;
          case ExtraAction.rateUs:
            final _inAppReview = InAppReview.instance;
            await _inAppReview.openStoreListing(
              appStoreId: '_appStoreId',
              microsoftStoreId: '_microsoftStoreId',
            );
            break;
          case ExtraAction.invite:
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
              dynamicLinkParametersOptions: DynamicLinkParametersOptions(
                shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
              ),
              iosParameters: IosParameters(
                // FIXME
                bundleId: 'com.google.FirebaseCppDynamicLinksTestApp.dev',
                minimumVersion: '0',
              ),
            );
            final shortLink = await parameters.buildShortLink();
            final url = shortLink.shortUrl;
            await Share.share(S.of(context).txt_invite_description(url),
                subject: S.of(context).txt_dynamic_link_invite_subject);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.feedback,
          child: Text(S.of(context).txt_button_feedback),
        ),
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.rateUs,
          child: Text(S.of(context).txt_about_rate),
        ),
        PopupMenuItem<ExtraAction>(
          value: ExtraAction.invite,
          child: Text(S.of(context).txt_about_invite),
        ),
      ],
    );
  }
}

enum ExtraAction { feedback, rateUs, invite }
