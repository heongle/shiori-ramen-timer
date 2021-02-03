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

class AppLocalizations {
  AppLocalizations();
  
  static AppLocalizations current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      AppLocalizations.current = AppLocalizations();
      
      return AppLocalizations.current;
    });
  } 

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `シオリラーメンタイマー`
  String get title {
    return Intl.message(
      'シオリラーメンタイマー',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `アプリについて`
  String get about {
    return Intl.message(
      'アプリについて',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `残り時間`
  String get remainingTime {
    return Intl.message(
      '残り時間',
      name: 'remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `開始`
  String get start {
    return Intl.message(
      '開始',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `終了`
  String get stop {
    return Intl.message(
      '終了',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `音声1`
  String get type1 {
    return Intl.message(
      '音声1',
      name: 'type1',
      desc: '',
      args: [],
    );
  }

  /// `音声2`
  String get type2 {
    return Intl.message(
      '音声2',
      name: 'type2',
      desc: '',
      args: [],
    );
  }

  /// `音声3`
  String get type3 {
    return Intl.message(
      '音声3',
      name: 'type3',
      desc: '',
      args: [],
    );
  }

  /// `音声4`
  String get type4 {
    return Intl.message(
      '音声4',
      name: 'type4',
      desc: '',
      args: [],
    );
  }

  /// `外部ライブラリ`
  String get usedLib {
    return Intl.message(
      '外部ライブラリ',
      name: 'usedLib',
      desc: '',
      args: [],
    );
  }

  /// `ライセンス`
  String get license {
    return Intl.message(
      'ライセンス',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `アクセス`
  String get visit {
    return Intl.message(
      'アクセス',
      name: 'visit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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