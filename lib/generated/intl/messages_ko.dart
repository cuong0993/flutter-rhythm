// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static m0(input) => "도달한 레벨 %";

  static m1(input) => "Hit Notes 을 ${input} 해봐요!";

  static m2(input) => "레벨 ${input}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "acoustic_guitar" : MessageLookupByLibrary.simpleMessage("어커스틱 기타"),
    "electric_guitar" : MessageLookupByLibrary.simpleMessage("전자 기타"),
    "piano" : MessageLookupByLibrary.simpleMessage("피아노"),
    "txt_about_invite" : MessageLookupByLibrary.simpleMessage("초대하다"),
    "txt_about_rate" : MessageLookupByLibrary.simpleMessage("평가해주세요"),
    "txt_all_ok" : MessageLookupByLibrary.simpleMessage("알겠어요"),
    "txt_all_songs" : MessageLookupByLibrary.simpleMessage("모든 노래"),
    "txt_button_feedback" : MessageLookupByLibrary.simpleMessage("피드백 해주세요"),
    "txt_button_quit" : MessageLookupByLibrary.simpleMessage("그만하다."),
    "txt_button_restart" : MessageLookupByLibrary.simpleMessage("다시 플레이"),
    "txt_button_sign_in_facebook" : MessageLookupByLibrary.simpleMessage("페북으로 로그인하세요"),
    "txt_button_sign_in_google" : MessageLookupByLibrary.simpleMessage("구글로 로그인 하세요"),
    "txt_configure" : MessageLookupByLibrary.simpleMessage("구성"),
    "txt_dialog_level_up_description" : m0,
    "txt_dialog_loading_sound_description" : MessageLookupByLibrary.simpleMessage("사운드 로딩중…"),
    "txt_difficult" : MessageLookupByLibrary.simpleMessage("어려움"),
    "txt_dynamic_link_invite_subject" : MessageLookupByLibrary.simpleMessage("히트틱이 초대했어요"),
    "txt_easy" : MessageLookupByLibrary.simpleMessage("쉬운"),
    "txt_game_button_continue" : MessageLookupByLibrary.simpleMessage("계속하기"),
    "txt_game_complete_loading_gift" : MessageLookupByLibrary.simpleMessage("보상받기…"),
    "txt_instrument_title_instruments" : MessageLookupByLibrary.simpleMessage("악기"),
    "txt_invite_description" : m1,
    "txt_level" : m2,
    "txt_medium" : MessageLookupByLibrary.simpleMessage("미디엄"),
    "txt_page_title_account" : MessageLookupByLibrary.simpleMessage("계정"),
    "txt_select_language" : MessageLookupByLibrary.simpleMessage("언어 선택"),
    "txt_start" : MessageLookupByLibrary.simpleMessage("시작"),
    "txt_too_early" : MessageLookupByLibrary.simpleMessage("너무 일찍"),
    "txt_too_late" : MessageLookupByLibrary.simpleMessage("너무 늦음"),
    "txt_too_many_fingers" : MessageLookupByLibrary.simpleMessage("손가락이 너무 많음")
  };
}
