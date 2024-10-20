import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/scanned_document_model.dart';

class DocumentDetailScreen extends StatelessWidget {
  final ScannedDocument document;

  const DocumentDetailScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scanned on: ${DateFormat('yyyy-MM-dd HH:mm').format(document.scanDate)}',
              style:const  TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Extracted Text:'),
            const SizedBox(height: 8),
            Text(document.extractedText),
            const SizedBox(height: 16),
            Image.file(File(document.imagePath)),
          ],
        ),
      ),
    );
  }
}
