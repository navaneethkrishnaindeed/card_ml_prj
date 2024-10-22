import 'package:card_ml_prj/domain/utils/functions.dart';
import 'package:hive/hive.dart';

part 'scanned_document_model.g.dart';

@HiveType(typeId: 0)
class ScannedDocument extends HiveObject {
  @HiveField(0)
  final String imagePath;

  @HiveField(1)
  final String extractedText;

  @HiveField(2)
  final DateTime scanDate;

  @HiveField(3)
  final List<BlockEntity> blockEntity;

  ScannedDocument({required this.imagePath, required this.extractedText, required this.scanDate, required this.blockEntity});
}

@HiveType(typeId: 1)
class BlockEntity {
  @HiveField(0)
  final EntityType type;
  @HiveField(1)
  final String data;
  BlockEntity({required this.data, required this.type});
}

@HiveType(typeId: 2)
enum EntityType {
  @HiveField(0)
  company,
  @HiveField(1)
  name,
  @HiveField(2)
  phone,
  @HiveField(3)
  email,
  @HiveField(4)
  unknown,
}
