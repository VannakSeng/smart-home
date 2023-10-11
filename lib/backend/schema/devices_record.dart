import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevicesRecord extends FirestoreRecord {
  DevicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
    _active = snapshotData['active'] as bool?;
    _photo = snapshotData['photo'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('devices')
          : FirebaseFirestore.instance.collectionGroup('devices');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('devices').doc();

  static Stream<DevicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DevicesRecord.fromSnapshot(s));

  static Future<DevicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DevicesRecord.fromSnapshot(s));

  static DevicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DevicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DevicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DevicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DevicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DevicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDevicesRecordData({
  String? name,
  bool? status,
  bool? active,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'status': status,
      'active': active,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DevicesRecordDocumentEquality implements Equality<DevicesRecord> {
  const DevicesRecordDocumentEquality();

  @override
  bool equals(DevicesRecord? e1, DevicesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.active == e2?.active &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(DevicesRecord? e) =>
      const ListEquality().hash([e?.name, e?.status, e?.active, e?.photo]);

  @override
  bool isValidKey(Object? o) => o is DevicesRecord;
}
