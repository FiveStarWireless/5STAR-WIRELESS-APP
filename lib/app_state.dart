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
      _termsAcceptedv4 =
          prefs.getBool('ff_termsAcceptedv4') ?? _termsAcceptedv4;
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

  bool _showRefreshedText = false;
  bool get showRefreshedText => _showRefreshedText;
  set showRefreshedText(bool value) {
    _showRefreshedText = value;
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

  String _clientId = '';
  String get clientId => _clientId;
  set clientId(String value) {
    _clientId = value;
    prefs.setString('ff_clientId', value);
  }

  bool _termsAcceptedv4 = false;
  bool get termsAcceptedv4 => _termsAcceptedv4;
  set termsAcceptedv4(bool value) {
    _termsAcceptedv4 = value;
    prefs.setBool('ff_termsAcceptedv4', value);
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

  List<String> _favoriteIds = [];
  List<String> get favoriteIds => _favoriteIds;
  set favoriteIds(List<String> value) {
    _favoriteIds = value;
  }

  void addToFavoriteIds(String value) {
    favoriteIds.add(value);
  }

  void removeFromFavoriteIds(String value) {
    favoriteIds.remove(value);
  }

  void removeAtIndexFromFavoriteIds(int index) {
    favoriteIds.removeAt(index);
  }

  void updateFavoriteIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favoriteIds[index] = updateFn(_favoriteIds[index]);
  }

  void insertAtIndexInFavoriteIds(int index, String value) {
    favoriteIds.insert(index, value);
  }

  List<String> _cartIds = [];
  List<String> get cartIds => _cartIds;
  set cartIds(List<String> value) {
    _cartIds = value;
  }

  void addToCartIds(String value) {
    cartIds.add(value);
  }

  void removeFromCartIds(String value) {
    cartIds.remove(value);
  }

  void removeAtIndexFromCartIds(int index) {
    cartIds.removeAt(index);
  }

  void updateCartIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    cartIds[index] = updateFn(_cartIds[index]);
  }

  void insertAtIndexInCartIds(int index, String value) {
    cartIds.insert(index, value);
  }

  int _homeBannerIndex = 0;
  int get homeBannerIndex => _homeBannerIndex;
  set homeBannerIndex(int value) {
    _homeBannerIndex = value;
  }

  List<String> _bannerImageList = [];
  List<String> get bannerImageList => _bannerImageList;
  set bannerImageList(List<String> value) {
    _bannerImageList = value;
  }

  void addToBannerImageList(String value) {
    bannerImageList.add(value);
  }

  void removeFromBannerImageList(String value) {
    bannerImageList.remove(value);
  }

  void removeAtIndexFromBannerImageList(int index) {
    bannerImageList.removeAt(index);
  }

  void updateBannerImageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bannerImageList[index] = updateFn(_bannerImageList[index]);
  }

  void insertAtIndexInBannerImageList(int index, String value) {
    bannerImageList.insert(index, value);
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
