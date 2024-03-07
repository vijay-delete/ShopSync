import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "PhoneNo" field.
  String? _phoneNo;
  String get phoneNo => _phoneNo ?? '';
  bool hasPhoneNo() => _phoneNo != null;

  // "Groups" field.
  List<DocumentReference>? _groups;
  List<DocumentReference> get groups => _groups ?? const [];
  bool hasGroups() => _groups != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _email = snapshotData['Email'] as String?;
    _image = snapshotData['Image'] as String?;
    _phoneNo = snapshotData['PhoneNo'] as String?;
    _groups = getDataList(snapshotData['Groups']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

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
  String? name,
  String? email,
  String? image,
  String? phoneNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Email': email,
      'Image': image,
      'PhoneNo': phoneNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.image == e2?.image &&
        e1?.phoneNo == e2?.phoneNo &&
        listEquality.equals(e1?.groups, e2?.groups);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality()
      .hash([e?.name, e?.email, e?.image, e?.phoneNo, e?.groups]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
