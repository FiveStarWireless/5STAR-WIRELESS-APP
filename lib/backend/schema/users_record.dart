import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "fcm_tokens" field.
  List<String>? _fcmTokens;
  List<String> get fcmTokens => _fcmTokens ?? const [];
  bool hasFcmTokens() => _fcmTokens != null;

  // "last_login_time" field.
  DateTime? _lastLoginTime;
  DateTime? get lastLoginTime => _lastLoginTime;
  bool hasLastLoginTime() => _lastLoginTime != null;

  // "provider" field.
  String? _provider;
  String get provider => _provider ?? '';
  bool hasProvider() => _provider != null;

  // "wishlistIds" field.
  List<String>? _wishlistIds;
  List<String> get wishlistIds => _wishlistIds ?? const [];
  bool hasWishlistIds() => _wishlistIds != null;

  // "cartIds" field.
  List<String>? _cartIds;
  List<String> get cartIds => _cartIds ?? const [];
  bool hasCartIds() => _cartIds != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fcmTokens = getDataList(snapshotData['fcm_tokens']);
    _lastLoginTime = snapshotData['last_login_time'] as DateTime?;
    _provider = snapshotData['provider'] as String?;
    _wishlistIds = getDataList(snapshotData['wishlistIds']);
    _cartIds = getDataList(snapshotData['cartIds']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? lastLoginTime,
  String? provider,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_login_time': lastLoginTime,
      'provider': provider,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.fcmTokens, e2?.fcmTokens) &&
        e1?.lastLoginTime == e2?.lastLoginTime &&
        e1?.provider == e2?.provider &&
        listEquality.equals(e1?.wishlistIds, e2?.wishlistIds) &&
        listEquality.equals(e1?.cartIds, e2?.cartIds);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.fcmTokens,
        e?.lastLoginTime,
        e?.provider,
        e?.wishlistIds,
        e?.cartIds
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
