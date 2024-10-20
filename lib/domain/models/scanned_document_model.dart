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

  ScannedDocument({
    required this.imagePath,
    required this.extractedText,
    required this.scanDate,
  });
}