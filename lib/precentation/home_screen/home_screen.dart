import 'package:flutter/material.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // File? _image;

  

  Future extractText() async {
    DocumentScannerOptions documentOptions = DocumentScannerOptions(
      documentFormat: DocumentFormat.jpeg, // set output document format
      mode: ScannerMode.filter, // to control what features are enabled
      pageLimit: 1, // setting a limit to the number of pages scanned
      isGalleryImport: true, // importing from the photo gallery
    );
    final documentScanner = DocumentScanner(options: documentOptions);
    DocumentScanningResult result = await documentScanner.scanDocument();

    final textDetector = TextRecognizer();
    final RecognizedText recognizedText = await textDetector.processImage(InputImage.fromFilePath(result.images.last));
    data.value = recognizedText.text;
    textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Visiting Card Scanner')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            ElevatedButton(
              onPressed: () {
                extractText();
              },
              child:const Text('Extract Text'),
            ),
           const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<String>(
              valueListenable: data,
              builder: (context, value, child) {
                return Text(value);
              },
            )
          ],
        ),
      ),
    );
  }
}

ValueNotifier<String> data = ValueNotifier("");
