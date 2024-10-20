import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'domain/models/scanned_document_model.dart';
import 'infrastructure/local_storage/hive_scanned_document_repo.dart';
import 'precentation/app.dart';

Future<void> main() async {
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ScannedDocumentAdapter());
  final repository = HiveScannedDocumentRepository();
  await repository.initialize();
  runApp(MyApp());
}
