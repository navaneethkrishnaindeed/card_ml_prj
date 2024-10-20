import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/scanned_document_model.dart';
import '../../document_detail_screen/document_detail_screen.dart';

class DocumentListItem extends StatelessWidget {
  final ScannedDocument document;
  final VoidCallback onDelete;

  const DocumentListItem({
    super.key,
    required this.document,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          DateFormat('yyyy-MM-dd HH:mm').format(document.scanDate),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          document.extractedText.length > 50 ? '${document.extractedText.substring(0, 50)}...' : document.extractedText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DocumentDetailScreen(document: document),
            ),
          );
        },
      ),
    );
  }
}
