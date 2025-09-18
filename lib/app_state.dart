import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _termsAcceptedv1 =
          prefs.getBool('ff_termsAcceptedv1') ?? _termsAcceptedv1;
    });
    _safeInit(() {
      _termsAcceptedv2 =
          prefs.getBool('ff_termsAcceptedv2') ?? _termsAcceptedv2;
    });
    _safeInit(() {
      _termsAcceptedv3 =
          prefs.getBool('ff_termsAcceptedv3') ?? _termsAcceptedv3;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _activeTabIndex = 0;
  int get activeTabIndex => _activeTabIndex;
  set activeTabIndex(int value) {
    _activeTabIndex = value;
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  bool _termsAcceptedv1 = false;
  bool get termsAcceptedv1 => _termsAcceptedv1;
  set termsAcceptedv1(bool value) {
    _termsAcceptedv1 = value;
    prefs.setBool('ff_termsAcceptedv1', value);
  }

  bool _termsAcceptedv2 = false;
  bool get termsAcceptedv2 => _termsAcceptedv2;
  set termsAcceptedv2(bool value) {
    _termsAcceptedv2 = value;
    prefs.setBool('ff_termsAcceptedv2', value);
  }

  bool _termsAcceptedv3 = false;
  bool get termsAcceptedv3 => _termsAcceptedv3;
  set termsAcceptedv3(bool value) {
    _termsAcceptedv3 = value;
    prefs.setBool('ff_termsAcceptedv3', value);
  }

  bool _bottomSeen = false;
  bool get bottomSeen => _bottomSeen;
  set bottomSeen(bool value) {
    _bottomSeen = value;
  }

  bool _visitedTerms = false;
  bool get visitedTerms => _visitedTerms;
  set visitedTerms(bool value) {
    _visitedTerms = value;
  }

  bool _visitedRefund = false;
  bool get visitedRefund => _visitedRefund;
  set visitedRefund(bool value) {
    _visitedRefund = value;
  }

  bool _visitedStore = false;
  bool get visitedStore => _visitedStore;
  set visitedStore(bool value) {
    _visitedStore = value;
  }

  bool _visitedShipping = false;
  bool get visitedShipping => _visitedShipping;
  set visitedShipping(bool value) {
    _visitedShipping = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
