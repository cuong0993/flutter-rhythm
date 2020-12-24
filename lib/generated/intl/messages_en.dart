// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(input) => "Reached level ${input}";

  static m1(input) => "${input} fingers";

  static m2(input) => "Hey, let play Hit Notes ${input}";

  static m3(input) => "Joined ${input}";

  static m4(input) => "Level ${input}";

  static m5(input) => "Using ${input}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "acoustic_guitar" : MessageLookupByLibrary.simpleMessage("Acoustic Guitar"),
    "classic" : MessageLookupByLibrary.simpleMessage("Classic"),
    "electric_guitar" : MessageLookupByLibrary.simpleMessage("Electric Guitar"),
    "folk" : MessageLookupByLibrary.simpleMessage("Folk"),
    "kpop" : MessageLookupByLibrary.simpleMessage("Kpop"),
    "piano" : MessageLookupByLibrary.simpleMessage("Piano"),
    "pop" : MessageLookupByLibrary.simpleMessage("Pop"),
    "txt_about_invite" : MessageLookupByLibrary.simpleMessage("Invite"),
    "txt_about_rate" : MessageLookupByLibrary.simpleMessage("Rate us"),
    "txt_all_ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "txt_all_songs" : MessageLookupByLibrary.simpleMessage("All songs"),
    "txt_button_feedback" : MessageLookupByLibrary.simpleMessage("Feedback us"),
    "txt_button_quit" : MessageLookupByLibrary.simpleMessage("Quit"),
    "txt_button_restart" : MessageLookupByLibrary.simpleMessage("Play again"),
    "txt_button_sign_in_facebook" : MessageLookupByLibrary.simpleMessage("Sign in with Facebook"),
    "txt_button_sign_in_google" : MessageLookupByLibrary.simpleMessage("Sign in with Google"),
    "txt_configure" : MessageLookupByLibrary.simpleMessage("Configure"),
    "txt_dialog_level_up_description" : m0,
    "txt_dialog_loading_sound_description" : MessageLookupByLibrary.simpleMessage("Loading sound…"),
    "txt_difficult" : MessageLookupByLibrary.simpleMessage("Difficult"),
    "txt_difficulty" : MessageLookupByLibrary.simpleMessage("Difficulty"),
    "txt_dynamic_link_invite_subject" : MessageLookupByLibrary.simpleMessage("Hit Notes invite"),
    "txt_easy" : MessageLookupByLibrary.simpleMessage("Easy"),
    "txt_fast" : MessageLookupByLibrary.simpleMessage("Fast"),
    "txt_fingers" : m1,
    "txt_game_button_continue" : MessageLookupByLibrary.simpleMessage("Continue"),
    "txt_game_complete_loading_gift" : MessageLookupByLibrary.simpleMessage("Getting reward…"),
    "txt_instrument_title_instruments" : MessageLookupByLibrary.simpleMessage("Instruments"),
    "txt_invite_description" : m2,
    "txt_joined" : m3,
    "txt_level" : m4,
    "txt_medium" : MessageLookupByLibrary.simpleMessage("Medium"),
    "txt_normal" : MessageLookupByLibrary.simpleMessage("Normal"),
    "txt_page_title_account" : MessageLookupByLibrary.simpleMessage("Account"),
    "txt_select_language" : MessageLookupByLibrary.simpleMessage("Select language"),
    "txt_slow" : MessageLookupByLibrary.simpleMessage("Slow"),
    "txt_speed" : MessageLookupByLibrary.simpleMessage("Speed"),
    "txt_start" : MessageLookupByLibrary.simpleMessage("Start"),
    "txt_too_early" : MessageLookupByLibrary.simpleMessage("Too early"),
    "txt_too_late" : MessageLookupByLibrary.simpleMessage("Too late"),
    "txt_too_many_fingers" : MessageLookupByLibrary.simpleMessage("Too many fingers"),
    "txt_using" : m5
  };
}
