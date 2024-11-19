// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> mr = {"hello": "नमस्कार"};
  static const Map<String, dynamic> en = {"hello": "Hello"};
  static const Map<String, dynamic> hi = {"hello": "नमस्ते"};
  static const Map<String, dynamic> en_US = {"hello": "Howdy"};
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "mr": mr,
    "en": en,
    "hi": hi,
    "en_US": en_US
  };
}
