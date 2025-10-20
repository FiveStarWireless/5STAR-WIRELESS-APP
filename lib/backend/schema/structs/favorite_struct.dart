// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FavoriteStruct extends FFFirebaseStruct {
  FavoriteStruct({
    String? title,
    String? url,
    DateTime? addedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _url = url,
        _addedAt = addedAt,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "addedAt" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  set addedAt(DateTime? val) => _addedAt = val;

  bool hasAddedAt() => _addedAt != null;

  static FavoriteStruct fromMap(Map<String, dynamic> data) => FavoriteStruct(
        title: data['Title'] as String?,
        url: data['url'] as String?,
        addedAt: data['addedAt'] as DateTime?,
      );

  static FavoriteStruct? maybeFromMap(dynamic data) =>
      data is Map ? FavoriteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'url': _url,
        'addedAt': _addedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'addedAt': serializeParam(
          _addedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static FavoriteStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavoriteStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        addedAt: deserializeParam(
          data['addedAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'FavoriteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavoriteStruct &&
        title == other.title &&
        url == other.url &&
        addedAt == other.addedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([title, url, addedAt]);
}

FavoriteStruct createFavoriteStruct({
  String? title,
  String? url,
  DateTime? addedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FavoriteStruct(
      title: title,
      url: url,
      addedAt: addedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FavoriteStruct? updateFavoriteStruct(
  FavoriteStruct? favorite, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    favorite
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFavoriteStructData(
  Map<String, dynamic> firestoreData,
  FavoriteStruct? favorite,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (favorite == null) {
    return;
  }
  if (favorite.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && favorite.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final favoriteData = getFavoriteFirestoreData(favorite, forFieldValue);
  final nestedData = favoriteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = favorite.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFavoriteFirestoreData(
  FavoriteStruct? favorite, [
  bool forFieldValue = false,
]) {
  if (favorite == null) {
    return {};
  }
  final firestoreData = mapToFirestore(favorite.toMap());

  // Add any Firestore field values
  favorite.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFavoriteListFirestoreData(
  List<FavoriteStruct>? favorites,
) =>
    favorites?.map((e) => getFavoriteFirestoreData(e, true)).toList() ?? [];
