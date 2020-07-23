import 'package:flutter/material.dart';
import 'package:flutter_i18n_extension/src/core/i18n/i18n.dart';
import 'package:flutter_i18n_extension/src/core/storage/storage.dart';
import 'package:flutter_i18n_extension/src/ui/pages/detail/detail_page.dart';
import 'package:flutter_i18n_extension/src/ui/pages/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StoredSettings _settings;

  @override
  void initState() {
    _settings = StoredSettings();
    _settings.init();
    super.initState();
  }

  @override
  void dispose() {
    _settings?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StoredSettings>.value(value: _settings),
      ],
      child: StreamBuilder<StoredSettings>(
        stream: _settings.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'i18n extension',
            theme: ThemeData.dark(),
            locale: getLocale(_settings.localeKey),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: kSupportedLocales,
            initialRoute: HomePage.route,
            routes: {
              HomePage.route: (context) => HomePage(),
              DetailPage.route: (context) => DetailPage(),
            },
          );
        },
      ),
    );
  }
}
