import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'aydin_kadin_dogum_record.g.dart';

abstract class AydinKadinDogumRecord
    implements Built<AydinKadinDogumRecord, AydinKadinDogumRecordBuilder> {
  static Serializer<AydinKadinDogumRecord> get serializer =>
      _$aydinKadinDogumRecordSerializer;

  @nullable
  BuiltList<String> get brans;

  @nullable
  BuiltList<String> get email;

  @nullable
  BuiltList<int> get id;

  @nullable
  BuiltList<String> get idariGorev;

  @nullable
  BuiltList<String> get isim;

  @nullable
  BuiltList<String> get resimUrl;

  @nullable
  BuiltList<String> get telefon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AydinKadinDogumRecordBuilder builder) =>
      builder
        ..brans = ListBuilder()
        ..email = ListBuilder()
        ..id = ListBuilder()
        ..idariGorev = ListBuilder()
        ..isim = ListBuilder()
        ..resimUrl = ListBuilder()
        ..telefon = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AydinKadinDogum');

  static Stream<AydinKadinDogumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AydinKadinDogumRecord._();
  factory AydinKadinDogumRecord(
          [void Function(AydinKadinDogumRecordBuilder) updates]) =
      _$AydinKadinDogumRecord;
}

Map<String, dynamic> createAydinKadinDogumRecordData() =>
    serializers.serializeWith(
        AydinKadinDogumRecord.serializer,
        AydinKadinDogumRecord((a) => a
          ..brans = null
          ..email = null
          ..id = null
          ..idariGorev = null
          ..isim = null
          ..resimUrl = null
          ..telefon = null));

AydinKadinDogumRecord get dummyAydinKadinDogumRecord {
  final builder = AydinKadinDogumRecordBuilder()
    ..brans = ListBuilder([dummyString, dummyString])
    ..email = ListBuilder([dummyString, dummyString])
    ..id = ListBuilder([dummyInteger, dummyInteger])
    ..idariGorev = ListBuilder([dummyString, dummyString])
    ..isim = ListBuilder([dummyString, dummyString])
    ..resimUrl = ListBuilder([dummyImagePath, dummyImagePath])
    ..telefon = ListBuilder([dummyString, dummyString]);
  return builder.build();
}

List<AydinKadinDogumRecord> createDummyAydinKadinDogumRecord({int count}) =>
    List.generate(count, (_) => dummyAydinKadinDogumRecord);
