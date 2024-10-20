import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../application/bloc/home_bloc.dart';
import '../../domain/models/scanned_document_model.dart';
import 'widgets/document_list_item.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.started());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Documents'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.documents.isEmpty) {
            return const Center(
              child:  Text('No documents scanned yet.'),
            );
          }
          return ListView.builder(
            itemCount: state.documents.length,
            itemBuilder: (context, index) {
              final document = state.documents[index];
              return DocumentListItem(
                document: document,
                onDelete: () {
                  context.read<HomeBloc>().add(HomeEvent.deleteDocument(index: index));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(const HomeEvent.extractText());
        },
        child:const  Icon(Icons.add),
        tooltip: 'Scan new document',
      ),
    );
  }
}