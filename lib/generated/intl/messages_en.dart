// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "check_login_data_error": MessageLookupByLibrary.simpleMessage(
            "Please check your login data"),
        "empty_label": MessageLookupByLibrary.simpleMessage("Empty"),
        "game_detail_unavailable":
            MessageLookupByLibrary.simpleMessage("Game data Not Available"),
        "home_title": MessageLookupByLibrary.simpleMessage("Home"),
        "image_unavailable":
            MessageLookupByLibrary.simpleMessage("Image Not Available"),
        "login_title": MessageLookupByLibrary.simpleMessage("Login"),
        "name_label": MessageLookupByLibrary.simpleMessage("Name"),
        "news_title": MessageLookupByLibrary.simpleMessage("News"),
        "password_label": MessageLookupByLibrary.simpleMessage("Password"),
        "phoneno_label": MessageLookupByLibrary.simpleMessage("Phone No"),
        "profile_tab_title": MessageLookupByLibrary.simpleMessage("Profile"),
        "register_label": MessageLookupByLibrary.simpleMessage("Register"),
        "register_success_label":
            MessageLookupByLibrary.simpleMessage("Register Success"),
        "user_not_found_error":
            MessageLookupByLibrary.simpleMessage("User not found"),
        "username_label": MessageLookupByLibrary.simpleMessage("Username")
      };
}
