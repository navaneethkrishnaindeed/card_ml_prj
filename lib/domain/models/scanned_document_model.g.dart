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
      blockEntity: (fields[3] as List).cast<BlockEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScannedDocument obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.extractedText)
      ..writeByte(2)
      ..write(obj.scanDate)
      ..writeByte(3)
      ..write(obj.blockEntity);
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

class BlockEntityAdapter extends TypeAdapter<BlockEntity> {
  @override
  final int typeId = 1;

  @override
  BlockEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlockEntity(
      data: fields[1] as String,
      type: fields[0] as EntityType,
    );
  }

  @override
  void write(BinaryWriter writer, BlockEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EntityTypeAdapter extends TypeAdapter<EntityType> {
  @override
  final int typeId = 2;

  @override
  EntityType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EntityType.company;
      case 1:
        return EntityType.name;
      case 2:
        return EntityType.phone;
      case 3:
        return EntityType.email;
      case 4:
        return EntityType.unknown;
      default:
        return EntityType.company;
    }
  }

  @override
  void write(BinaryWriter writer, EntityType obj) {
    switch (obj) {
      case EntityType.company:
        writer.writeByte(0);
        break;
      case EntityType.name:
        writer.writeByte(1);
        break;
      case EntityType.phone:
        writer.writeByte(2);
        break;
      case EntityType.email:
        writer.writeByte(3);
        break;
      case EntityType.unknown:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
