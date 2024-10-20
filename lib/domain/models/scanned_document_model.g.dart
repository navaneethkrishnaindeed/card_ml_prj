// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_document_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScannedDocumentAdapter extends TypeAdapter<ScannedDocument> {
  @override
  final int typeId = 0;

  @override
  ScannedDocument read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannedDocument(
      imagePath: fields[0] as String,
      extractedText: fields[1] as String,
      scanDate: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ScannedDocument obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.extractedText)
      ..writeByte(2)
      ..write(obj.scanDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannedDocumentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
