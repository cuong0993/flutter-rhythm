// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Acoustic Guitar`
  String get acoustic_guitar {
    return Intl.message(
      'Acoustic Guitar',
      name: 'acoustic_guitar',
      desc: '',
      args: [],
    );
  }

  /// `Electric Guitar`
  String get electric_guitar {
    return Intl.message(
      'Electric Guitar',
      name: 'electric_guitar',
      desc: '',
      args: [],
    );
  }

  /// `Piano`
  String get piano {
    return Intl.message(
      'Piano',
      name: 'piano',
      desc: '',
      args: [],
    );
  }

  /// `Invite`
  String get txt_about_invite {
    return Intl.message(
      'Invite',
      name: 'txt_about_invite',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get txt_about_rate {
    return Intl.message(
      'Rate us',
      name: 'txt_about_rate',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get txt_all_no {
    return Intl.message(
      'No',
      name: 'txt_all_no',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get txt_all_ok {
    return Intl.message(
      'Ok',
      name: 'txt_all_ok',
      desc: '',
      args: [],
    );
  }

  /// `All songs`
  String get txt_all_songs {
    return Intl.message(
      'All songs',
      name: 'txt_all_songs',
      desc: '',
      args: [],
    );
  }

  /// `Feedback us`
  String get txt_button_feedback {
    return Intl.message(
      'Feedback us',
      name: 'txt_button_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Quit`
  String get txt_button_quit {
    return Intl.message(
      'Quit',
      name: 'txt_button_quit',
      desc: '',
      args: [],
    );
  }

  /// `Play again`
  String get txt_button_restart {
    return Intl.message(
      'Play again',
      name: 'txt_button_restart',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get txt_button_sign_in_facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'txt_button_sign_in_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get txt_button_sign_in_google {
    return Intl.message(
      'Sign in with Google',
      name: 'txt_button_sign_in_google',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to close?`
  String get txt_dialog_exit_description {
    return Intl.message(
      'Do you want to close?',
      name: 'txt_dialog_exit_description',
      desc: '',
      args: [],
    );
  }

  /// `Exit Confirmation`
  String get txt_dialog_exit_name {
    return Intl.message(
      'Exit Confirmation',
      name: 'txt_dialog_exit_name',
      desc: '',
      args: [],
    );
  }

  /// `Reached level {input}`
  String txt_dialog_level_up_description(Object input) {
    return Intl.message(
      'Reached level $input',
      name: 'txt_dialog_level_up_description',
      desc: '',
      args: [input],
    );
  }

  /// `Congrats`
  String get txt_dialog_level_up_name {
    return Intl.message(
      'Congrats',
      name: 'txt_dialog_level_up_name',
      desc: '',
      args: [],
    );
  }

  /// `Loading sound…`
  String get txt_dialog_loading_sound_description {
    return Intl.message(
      'Loading sound…',
      name: 'txt_dialog_loading_sound_description',
      desc: '',
      args: [],
    );
  }

  /// `Logging in…`
  String get txt_dialog_logging_in_description {
    return Intl.message(
      'Logging in…',
      name: 'txt_dialog_logging_in_description',
      desc: '',
      args: [],
    );
  }

  /// `Remind me later`
  String get txt_dialog_rate_button_remind {
    return Intl.message(
      'Remind me later',
      name: 'txt_dialog_rate_button_remind',
      desc: '',
      args: [],
    );
  }

  /// `If you enjoy using this app, would you mind taking a moment to rate it? It won't take more than a minute. Thank you for your support!`
  String get txt_dialog_rate_description {
    return Intl.message(
      'If you enjoy using this app, would you mind taking a moment to rate it? It won\'t take more than a minute. Thank you for your support!',
      name: 'txt_dialog_rate_description',
      desc: '',
      args: [],
    );
  }

  /// `Rate us`
  String get txt_dialog_rate_name {
    return Intl.message(
      'Rate us',
      name: 'txt_dialog_rate_name',
      desc: '',
      args: [],
    );
  }

  /// `Reward`
  String get txt_dialog_reward_name {
    return Intl.message(
      'Reward',
      name: 'txt_dialog_reward_name',
      desc: '',
      args: [],
    );
  }

  /// `Hit Notes invite`
  String get txt_dynamic_link_invite_subject {
    return Intl.message(
      'Hit Notes invite',
      name: 'txt_dynamic_link_invite_subject',
      desc: '',
      args: [],
    );
  }

  /// `Error occurs`
  String get txt_error_occur {
    return Intl.message(
      'Error occurs',
      name: 'txt_error_occur',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get txt_game_button_continue {
    return Intl.message(
      'Continue',
      name: 'txt_game_button_continue',
      desc: '',
      args: [],
    );
  }

  /// `Reward`
  String get txt_game_complete_gift {
    return Intl.message(
      'Reward',
      name: 'txt_game_complete_gift',
      desc: '',
      args: [],
    );
  }

  /// `Getting reward…`
  String get txt_game_complete_loading_gift {
    return Intl.message(
      'Getting reward…',
      name: 'txt_game_complete_loading_gift',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get txt_game_complete_name {
    return Intl.message(
      'Finished',
      name: 'txt_game_complete_name',
      desc: '',
      args: [],
    );
  }

  /// `Paused`
  String get txt_game_dialog_pause_name {
    return Intl.message(
      'Paused',
      name: 'txt_game_dialog_pause_name',
      desc: '',
      args: [],
    );
  }

  /// `Instruments`
  String get txt_instrument_title_instruments {
    return Intl.message(
      'Instruments',
      name: 'txt_instrument_title_instruments',
      desc: '',
      args: [],
    );
  }

  /// `Hey, let play Hit Notes {input}`
  String txt_invite_description(Object input) {
    return Intl.message(
      'Hey, let play Hit Notes $input',
      name: 'txt_invite_description',
      desc: '',
      args: [input],
    );
  }

  /// `Level`
  String get txt_level {
    return Intl.message(
      'Level',
      name: 'txt_level',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get txt_page_title_account {
    return Intl.message(
      'Account',
      name: 'txt_page_title_account',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get txt_select_language {
    return Intl.message(
      'Select language',
      name: 'txt_select_language',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get txt_sign_in {
    return Intl.message(
      'Sign in',
      name: 'txt_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Too early`
  String get txt_too_early {
    return Intl.message(
      'Too early',
      name: 'txt_too_early',
      desc: '',
      args: [],
    );
  }

  /// `Too late`
  String get txt_too_late {
    return Intl.message(
      'Too late',
      name: 'txt_too_late',
      desc: '',
      args: [],
    );
  }

  /// `Too many fingers`
  String get txt_too_many_fingers {
    return Intl.message(
      'Too many fingers',
      name: 'txt_too_many_fingers',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}