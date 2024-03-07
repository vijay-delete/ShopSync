import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "ItemImage" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  bool hasItemImage() => _itemImage != null;

  // "DateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "Count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "Group" field.
  DocumentReference? _group;
  DocumentReference? get group => _group;
  bool hasGroup() => _group != null;

  // "IsBought" field.
  bool? _isBought;
  bool get isBought => _isBought ?? false;
  bool hasIsBought() => _isBought != null;

  // "IsDicarded" field.
  bool? _isDicarded;
  bool get isDicarded => _isDicarded ?? false;
  bool hasIsDicarded() => _isDicarded != null;

  // "IsNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  // "AddedBy" field.
  DocumentReference? _addedBy;
  DocumentReference? get addedBy => _addedBy;
  bool hasAddedBy() => _addedBy != null;

  // "BoughtOn" field.
  DateTime? _boughtOn;
  DateTime? get boughtOn => _boughtOn;
  bool hasBoughtOn() => _boughtOn != null;

  // "BoughtBy" field.
  DocumentReference? _boughtBy;
  DocumentReference? get boughtBy => _boughtBy;
  bool hasBoughtBy() => _boughtBy != null;

  // "DiscardedBy" field.
  DocumentReference? _discardedBy;
  DocumentReference? get discardedBy => _discardedBy;
  bool hasDiscardedBy() => _discardedBy != null;

  // "DiscardedOn" field.
  DateTime? _discardedOn;
  DateTime? get discardedOn => _discardedOn;
  bool hasDiscardedOn() => _discardedOn != null;

  // "ModifiedOn" field.
  DateTime? _modifiedOn;
  DateTime? get modifiedOn => _modifiedOn;
  bool hasModifiedOn() => _modifiedOn != null;

  // "ModifiedBy" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _itemImage = snapshotData['ItemImage'] as String?;
    _dateAdded = snapshotData['DateAdded'] as DateTime?;
    _count = castToType<int>(snapshotData['Count']);
    _group = snapshotData['Group'] as DocumentReference?;
    _isBought = snapshotData['IsBought'] as bool?;
    _isDicarded = snapshotData['IsDicarded'] as bool?;
    _isNew = snapshotData['IsNew'] as bool?;
    _addedBy = snapshotData['AddedBy'] as DocumentReference?;
    _boughtOn = snapshotData['BoughtOn'] as DateTime?;
    _boughtBy = snapshotData['BoughtBy'] as DocumentReference?;
    _discardedBy = snapshotData['DiscardedBy'] as DocumentReference?;
    _discardedOn = snapshotData['DiscardedOn'] as DateTime?;
    _modifiedOn = snapshotData['ModifiedOn'] as DateTime?;
    _modifiedBy = snapshotData['ModifiedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? name,
  String? description,
  String? itemImage,
  DateTime? dateAdded,
  int? count,
  DocumentReference? group,
  bool? isBought,
  bool? isDicarded,
  bool? isNew,
  DocumentReference? addedBy,
  DateTime? boughtOn,
  DocumentReference? boughtBy,
  DocumentReference? discardedBy,
  DateTime? discardedOn,
  DateTime? modifiedOn,
  DocumentReference? modifiedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'ItemImage': itemImage,
      'DateAdded': dateAdded,
      'Count': count,
      'Group': group,
      'IsBought': isBought,
      'IsDicarded': isDicarded,
      'IsNew': isNew,
      'AddedBy': addedBy,
      'BoughtOn': boughtOn,
      'BoughtBy': boughtBy,
      'DiscardedBy': discardedBy,
      'DiscardedOn': discardedOn,
      'ModifiedOn': modifiedOn,
      'ModifiedBy': modifiedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.itemImage == e2?.itemImage &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.count == e2?.count &&
        e1?.group == e2?.group &&
        e1?.isBought == e2?.isBought &&
        e1?.isDicarded == e2?.isDicarded &&
        e1?.isNew == e2?.isNew &&
        e1?.addedBy == e2?.addedBy &&
        e1?.boughtOn == e2?.boughtOn &&
        e1?.boughtBy == e2?.boughtBy &&
        e1?.discardedBy == e2?.discardedBy &&
        e1?.discardedOn == e2?.discardedOn &&
        e1?.modifiedOn == e2?.modifiedOn &&
        e1?.modifiedBy == e2?.modifiedBy;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.itemImage,
        e?.dateAdded,
        e?.count,
        e?.group,
        e?.isBought,
        e?.isDicarded,
        e?.isNew,
        e?.addedBy,
        e?.boughtOn,
        e?.boughtBy,
        e?.discardedBy,
        e?.discardedOn,
        e?.modifiedOn,
        e?.modifiedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
