// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

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

  /// `Rapid test for your eyes anywhere`
  String get tesSingkatKesehatanMataAndaDimanaSaja {
    return Intl.message(
      'Rapid test for your eyes anywhere',
      name: 'tesSingkatKesehatanMataAndaDimanaSaja',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get mulai {
    return Intl.message(
      'Start',
      name: 'mulai',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get hasil {
    return Intl.message(
      'Result',
      name: 'hasil',
      desc: '',
      args: [],
    );
  }

  /// `Test Instructions`
  String get instruksiTes {
    return Intl.message(
      'Test Instructions',
      name: 'instruksiTes',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get lanjut {
    return Intl.message(
      'Next',
      name: 'lanjut',
      desc: '',
      args: [],
    );
  }

  /// `Try`
  String get coba {
    return Intl.message(
      'Try',
      name: 'coba',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get lewati {
    return Intl.message(
      'Skip',
      name: 'lewati',
      desc: '',
      args: [],
    );
  }

  /// `RIGHT`
  String get kanan {
    return Intl.message(
      'RIGHT',
      name: 'kanan',
      desc: '',
      args: [],
    );
  }

  /// `BOTTOM`
  String get bawah {
    return Intl.message(
      'BOTTOM',
      name: 'bawah',
      desc: '',
      args: [],
    );
  }

  /// `Eye Sharpness Test`
  String get testKetajamanMata {
    return Intl.message(
      'Eye Sharpness Test',
      name: 'testKetajamanMata',
      desc: '',
      args: [],
    );
  }

  /// `Distance Test`
  String get testJarakJauh {
    return Intl.message(
      'Distance Test',
      name: 'testJarakJauh',
      desc: '',
      args: [],
    );
  }

  /// `This test aims to test the sharpness of your eyes`
  String get testIniBertujuanUntukMengujiKetajamanMataAnda {
    return Intl.message(
      'This test aims to test the sharpness of your eyes',
      name: 'testIniBertujuanUntukMengujiKetajamanMataAnda',
      desc: '',
      args: [],
    );
  }

  /// `Position your body from the device about 50cm to 100cm`
  String get posisikanTubuhAndaDariPerangkatPadaJarak50cmSampai100cm {
    return Intl.message(
      'Position your body from the device about 50cm to 100cm',
      name: 'posisikanTubuhAndaDariPerangkatPadaJarak50cmSampai100cm',
      desc: '',
      args: [],
    );
  }

  /// `Pay attention to the orientation of the symbol`
  String get perhatikanOrientasiSimbol {
    return Intl.message(
      'Pay attention to the orientation of the symbol',
      name: 'perhatikanOrientasiSimbol',
      desc: '',
      args: [],
    );
  }

  /// `You're asked to guess the orientation of the symbols that appear for 7 seconds`
  String get andaDimintaUntukMenebakOrientasiSimbolYangMunculSelama7 {
    return Intl.message(
      'You\'re asked to guess the orientation of the symbols that appear for 7 seconds',
      name: 'andaDimintaUntukMenebakOrientasiSimbolYangMunculSelama7',
      desc: '',
      args: [],
    );
  }

  /// `Point your head`
  String get arahkanKepala {
    return Intl.message(
      'Point your head',
      name: 'arahkanKepala',
      desc: '',
      args: [],
    );
  }

  /// `Answer by moving your head towards the corner of the screen according to the button arrangement until the timer on the button is finished`
  String get jawabDenganMenggerakkanKepalaMenujuPojokLayarSesuaiDenganSusunan {
    return Intl.message(
      'Answer by moving your head towards the corner of the screen according to the button arrangement until the timer on the button is finished',
      name: 'jawabDenganMenggerakkanKepalaMenujuPojokLayarSesuaiDenganSusunan',
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
      Locale.fromSubtags(languageCode: 'id'),
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