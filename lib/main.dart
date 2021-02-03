import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shiori_noodle_stopper/generated/l10n.dart';
import 'package:shiori_noodle_stopper/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Color> _swatchColor = {
    50:Color.fromRGBO(154, 65, 156, .1),
    100:Color.fromRGBO(154, 65, 156, .2),
    200:Color.fromRGBO(154, 65, 156, .3),
    300:Color.fromRGBO(154, 65, 156, .4),
    400:Color.fromRGBO(154, 65, 156, .5),
    500:Color.fromRGBO(154, 65, 156, .6),
    600:Color.fromRGBO(154, 65, 156, .7),
    700:Color.fromRGBO(154, 65, 156, .8),
    800:Color.fromRGBO(154, 65, 156, .9),
    900:Color.fromRGBO(154, 65, 156, 1),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''), // Japanese, no country code
        const Locale('zh', ''), // Chinese, no country code
        const Locale('en', ''), // English, no country code
      ],
      title: 'Shiori Noodle Stopper',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF85357c, _swatchColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
