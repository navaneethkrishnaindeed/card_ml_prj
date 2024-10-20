import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../domain/models/scanned_document_model.dart';
import '../../infrastructure/local_storage/hive_scanned_document_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HiveScannedDocumentRepository _repository = HiveScannedDocumentRepository();

  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (event) async {
          final documents = await _repository.getAllDocuments();
          emit(state.copyWith(documents: documents));
        },
        extractText: (event) async {
          DocumentScannerOptions documentOptions = DocumentScannerOptions(
            documentFormat: DocumentFormat.jpeg,
            mode: ScannerMode.filter,
            pageLimit: 1,
            isGalleryImport: true,
          );
          final documentScanner = DocumentScanner(options: documentOptions);
          final textDetector = TextRecognizer();

          try {
            final result = await documentScanner.scanDocument();
            if (result.images.isNotEmpty) {
              final recognizedText = await textDetector.processImage(
                InputImage.fromFilePath(result.images.last),
              );

              // Save image to app directory
              final appDir = await getApplicationDocumentsDirectory();
              final fileName = 'scanned_doc_${DateTime.now().millisecondsSinceEpoch}.jpg';
              final savedImage = await File(result.images.last).copy('${appDir.path}/$fileName');

              final newDocument = ScannedDocument(
                imagePath: savedImage.path,
                extractedText: recognizedText.text,
                scanDate: DateTime.now(),
              );
              print("uuuu");

              await _repository.addDocument(newDocument);
              print("ggg");

              final updatedDocuments = await _repository.getAllDocuments();
              emit(state.copyWith(
                scannedData: recognizedText.text,
                documents: updatedDocuments,
              ));
              print("hhh̤");
              print(updatedDocuments);
            }
          } catch (e) {
            emit(state.copyWith(scannedData: e.toString()));
          } finally {
            await textDetector.close();
          }
        },
        deleteDocument: (event) async {
          await _repository.deleteDocument(event.index);
          final updatedDocuments = await _repository.getAllDocuments();
          emit(state.copyWith(documents: updatedDocuments));
        },
      );
    });
  }
}
