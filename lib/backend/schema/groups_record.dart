import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "GroupAdmin" field.
  DocumentReference? _groupAdmin;
  DocumentReference? get groupAdmin => _groupAdmin;
  bool hasGroupAdmin() => _groupAdmin != null;

  // "GroupCode" field.
  String? _groupCode;
  String get groupCode => _groupCode ?? '';
  bool hasGroupCode() => _groupCode != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _users = getDataList(snapshotData['Users']);
    _image = snapshotData['Image'] as String?;
    _groupAdmin = snapshotData['GroupAdmin'] as DocumentReference?;
    _groupCode = snapshotData['GroupCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  String? image,
  DocumentReference? groupAdmin,
  String? groupCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Image': image,
      'GroupAdmin': groupAdmin,
      'GroupCode': groupCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupsRecordDocumentEquality implements Equality<GroupsRecord> {
  const GroupsRecordDocumentEquality();

  @override
  bool equals(GroupsRecord? e1, GroupsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.image == e2?.image &&
        e1?.groupAdmin == e2?.groupAdmin &&
        e1?.groupCode == e2?.groupCode;
  }

  @override
  int hash(GroupsRecord? e) => const ListEquality()
      .hash([e?.name, e?.users, e?.image, e?.groupAdmin, e?.groupCode]);

  @override
  bool isValidKey(Object? o) => o is GroupsRecord;
}
