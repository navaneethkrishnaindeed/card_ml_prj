import 'dart:io';

import 'package:card_ml_prj/domain/utils/functions.dart';
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            document.blockEntity.isNotEmpty
                ? Container(
                    height: 100,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: document.blockEntity.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return
                            // height: 400,
                            Column(
                          children: [
                            document.blockEntity[index].type == EntityType.name ? Text("Name: ${document.blockEntity[index].data.trimRight()}") : const SizedBox(),
                            document.blockEntity[index].type == EntityType.email ? Text("Email: ${document.blockEntity[index].data}") : const SizedBox(),
                            document.blockEntity[index].type == EntityType.phone ? Text("Phone: ${document.blockEntity[index].data}") : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 30),
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
