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
      _clientId = prefs.getString('ff_clientId') ?? _clientId;
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
    _safeInit(() {
      _termsAccepted = prefs.getBool('ff_termsAccepted') ?? _termsAccepted;
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

  bool _toastAfterReload = false;
  bool get toastAfterReload => _toastAfterReload;
  set toastAfterReload(bool value) {
    _toastAfterReload = value;
  }

  bool _showToast = false;
  bool get showToast => _showToast;
  set showToast(bool value) {
    _showToast = value;
  }

  String _clientId = '';
  String get clientId => _clientId;
  set clientId(String value) {
    _clientId = value;
    prefs.setString('ff_clientId', value);
  }

  String _toastMessage = '';
  String get toastMessage => _toastMessage;
  set toastMessage(String value) {
    _toastMessage = value;
  }

  int _reloadTick = 0;
  int get reloadTick => _reloadTick;
  set reloadTick(int value) {
    _reloadTick = value;
  }

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;
  set isRefreshing(bool value) {
    _isRefreshing = value;
  }

  bool _showSettingsTray = false;
  bool get showSettingsTray => _showSettingsTray;
  set showSettingsTray(bool value) {
    _showSettingsTray = value;
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

  int _homeNonce = 0;
  int get homeNonce => _homeNonce;
  set homeNonce(int value) {
    _homeNonce = value;
  }

  int _storeNonce = 0;
  int get storeNonce => _storeNonce;
  set storeNonce(int value) {
    _storeNonce = value;
  }

  int _servicesNonce = 0;
  int get servicesNonce => _servicesNonce;
  set servicesNonce(int value) {
    _servicesNonce = value;
  }

  int _cartNonce = 0;
  int get cartNonce => _cartNonce;
  set cartNonce(int value) {
    _cartNonce = value;
  }

  int _faveNonce = 0;
  int get faveNonce => _faveNonce;
  set faveNonce(int value) {
    _faveNonce = value;
  }

  int _usersNonce = 0;
  int get usersNonce => _usersNonce;
  set usersNonce(int value) {
    _usersNonce = value;
  }

  String _longPressJson = '';
  String get longPressJson => _longPressJson;
  set longPressJson(String value) {
    _longPressJson = value;
  }

  bool _termsAccepted = false;
  bool get termsAccepted => _termsAccepted;
  set termsAccepted(bool value) {
    _termsAccepted = value;
    prefs.setBool('ff_termsAccepted', value);
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
