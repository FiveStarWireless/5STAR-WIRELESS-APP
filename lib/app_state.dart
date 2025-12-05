import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
    _safeInit(() {
      _cartItems = prefs.getStringList('ff_cartItems')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cartItems;
    });
    _safeInit(() {
      _wishlistItems = prefs.getStringList('ff_wishlistItems')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _wishlistItems;
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

  String _storeSearchText = '';
  String get storeSearchText => _storeSearchText;
  set storeSearchText(String value) {
    _storeSearchText = value;
  }

  int _prepaidSlideIndex = 0;
  int get prepaidSlideIndex => _prepaidSlideIndex;
  set prepaidSlideIndex(int value) {
    _prepaidSlideIndex = value;
  }

  bool _prepaidSliderOn = true;
  bool get prepaidSliderOn => _prepaidSliderOn;
  set prepaidSliderOn(bool value) {
    _prepaidSliderOn = value;
  }

  int _imageSlideIndex = 0;
  int get imageSlideIndex => _imageSlideIndex;
  set imageSlideIndex(int value) {
    _imageSlideIndex = value;
  }

  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;
  set cartItems(List<dynamic> value) {
    _cartItems = value;
    prefs.setStringList(
        'ff_cartItems', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCartItems(dynamic value) {
    cartItems.add(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCartItems(dynamic value) {
    cartItems.remove(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void updateCartItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCartItems(int index, dynamic value) {
    cartItems.insert(index, value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _wishlistItems = [];
  List<dynamic> get wishlistItems => _wishlistItems;
  set wishlistItems(List<dynamic> value) {
    _wishlistItems = value;
    prefs.setStringList(
        'ff_wishlistItems', value.map((x) => jsonEncode(x)).toList());
  }

  void addToWishlistItems(dynamic value) {
    wishlistItems.add(value);
    prefs.setStringList(
        'ff_wishlistItems', _wishlistItems.map((x) => jsonEncode(x)).toList());
  }

  void removeFromWishlistItems(dynamic value) {
    wishlistItems.remove(value);
    prefs.setStringList(
        'ff_wishlistItems', _wishlistItems.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromWishlistItems(int index) {
    wishlistItems.removeAt(index);
    prefs.setStringList(
        'ff_wishlistItems', _wishlistItems.map((x) => jsonEncode(x)).toList());
  }

  void updateWishlistItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    wishlistItems[index] = updateFn(_wishlistItems[index]);
    prefs.setStringList(
        'ff_wishlistItems', _wishlistItems.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInWishlistItems(int index, dynamic value) {
    wishlistItems.insert(index, value);
    prefs.setStringList(
        'ff_wishlistItems', _wishlistItems.map((x) => jsonEncode(x)).toList());
  }

  dynamic _selectedProduct;
  dynamic get selectedProduct => _selectedProduct;
  set selectedProduct(dynamic value) {
    _selectedProduct = value;
  }

  dynamic _selectedColorVariant;
  dynamic get selectedColorVariant => _selectedColorVariant;
  set selectedColorVariant(dynamic value) {
    _selectedColorVariant = value;
  }

  dynamic _selectedStorageVariant;
  dynamic get selectedStorageVariant => _selectedStorageVariant;
  set selectedStorageVariant(dynamic value) {
    _selectedStorageVariant = value;
  }

  List<String> _colorOptions = [];
  List<String> get colorOptions => _colorOptions;
  set colorOptions(List<String> value) {
    _colorOptions = value;
  }

  void addToColorOptions(String value) {
    colorOptions.add(value);
  }

  void removeFromColorOptions(String value) {
    colorOptions.remove(value);
  }

  void removeAtIndexFromColorOptions(int index) {
    colorOptions.removeAt(index);
  }

  void updateColorOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    colorOptions[index] = updateFn(_colorOptions[index]);
  }

  void insertAtIndexInColorOptions(int index, String value) {
    colorOptions.insert(index, value);
  }

  List<String> _storageOptions = [];
  List<String> get storageOptions => _storageOptions;
  set storageOptions(List<String> value) {
    _storageOptions = value;
  }

  void addToStorageOptions(String value) {
    storageOptions.add(value);
  }

  void removeFromStorageOptions(String value) {
    storageOptions.remove(value);
  }

  void removeAtIndexFromStorageOptions(int index) {
    storageOptions.removeAt(index);
  }

  void updateStorageOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    storageOptions[index] = updateFn(_storageOptions[index]);
  }

  void insertAtIndexInStorageOptions(int index, String value) {
    storageOptions.insert(index, value);
  }

  String _selectedColor = '';
  String get selectedColor => _selectedColor;
  set selectedColor(String value) {
    _selectedColor = value;
  }

  String _selectedStorage = '';
  String get selectedStorage => _selectedStorage;
  set selectedStorage(String value) {
    _selectedStorage = value;
  }

  String _selectedPrice = '';
  String get selectedPrice => _selectedPrice;
  set selectedPrice(String value) {
    _selectedPrice = value;
  }

  List<String> _selectedCartIds = [];
  List<String> get selectedCartIds => _selectedCartIds;
  set selectedCartIds(List<String> value) {
    _selectedCartIds = value;
  }

  void addToSelectedCartIds(String value) {
    selectedCartIds.add(value);
  }

  void removeFromSelectedCartIds(String value) {
    selectedCartIds.remove(value);
  }

  void removeAtIndexFromSelectedCartIds(int index) {
    selectedCartIds.removeAt(index);
  }

  void updateSelectedCartIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedCartIds[index] = updateFn(_selectedCartIds[index]);
  }

  void insertAtIndexInSelectedCartIds(int index, String value) {
    selectedCartIds.insert(index, value);
  }

  double _selectedCartTotal = 0.0;
  double get selectedCartTotal => _selectedCartTotal;
  set selectedCartTotal(double value) {
    _selectedCartTotal = value;
  }

  dynamic _currentCartItem;
  dynamic get currentCartItem => _currentCartItem;
  set currentCartItem(dynamic value) {
    _currentCartItem = value;
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
