import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_poc/extension/locale.dart';
import 'package:flutter/material.dart';

import '../generated/codegen_loader.g.dart';

class LocalizationAssetLoader extends AssetLoader {
  const LocalizationAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    if (LocaleExt.getLocalesBundledLocally().contains(locale)) {
      return Future.value(CodegenLoader.mapLocales[locale.toString()]);
    }

    try {
      print('-> Before mock delay: $locale');
      await Future.delayed(const Duration(milliseconds: 3000));
      print('-> After mock delay: $locale');
      return Future.value(CodegenLoader.mapLocales[locale.toString()]);
    } catch (e) {
      return {};
    }
  }
}
