import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_poc/extension/locale.dart';
import 'package:flutter/material.dart';

import 'l10n/localization_asset_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LocaleExt.getSupportedLocales().toList(),
      path: 'resources/langs',
      fallbackLocale: LocaleExt.en,
      assetLoader: const LocalizationAssetLoader(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // title: context.tr('flutter_demo'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // locale: const Locale('mr'),
      localeListResolutionCallback: (locales, supportedLocales) {
        print('-> localeListResolutionCallback');
        return null;
      },
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: <Widget>[
            for (Locale locale in LocaleExt.getSupportedLocales())
              FilledButton(
                child: Text(locale.toString()),
                onPressed: () {
                  context.setLocale(locale);
                },
              ),
            Text(context.tr('hello')),
          ],
        ),
      ),
    );
  }
}
