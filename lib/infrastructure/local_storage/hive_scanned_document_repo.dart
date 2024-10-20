import 'package:hive/hive.dart';

import '../../domain/models/scanned_document_model.dart';

abstract class ScannedDocumentRepository {
  Future<void> initialize();
  Future<void> addDocument(ScannedDocument document);
  Future<List<ScannedDocument>> getAllDocuments();
  Future<void> updateDocument(int index, ScannedDocument document);
  Future<void> deleteDocument(int index);
}


class HiveScannedDocumentRepository implements ScannedDocumentRepository {
  static const String _boxName = 'scanned_documents';
  late Box<ScannedDocument> _box;

  // Private constructor
  HiveScannedDocumentRepository._();

  // Singleton instance
  static final HiveScannedDocumentRepository _instance = HiveScannedDocumentRepository._();

  // Factory constructor to return the singleton instance
  factory HiveScannedDocumentRepository() => _instance;

  @override
  Future<void> initialize() async {
    _box = await Hive.openBox<ScannedDocument>(_boxName);
  }

  @override
  Future<void> addDocument(ScannedDocument document) async {
    await _box.add(document);
  }

  @override
  Future<List<ScannedDocument>> getAllDocuments() async {
    return _box.values.toList();
  }

  @override
  Future<void> updateDocument(int index, ScannedDocument document) async {
    await _box.putAt(index, document);
  }

  @override
  Future<void> deleteDocument(int index) async {
    await _box.deleteAt(index);
  }
}