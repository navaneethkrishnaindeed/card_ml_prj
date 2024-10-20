# Document Scanner App

## Overview

The Document Scanner App is a mobile application built with Flutter that allows users to scan documents, extract text using OCR, and manage their scanned documents. It provides a simple and efficient way to digitize and organize physical documents, with advanced scanning features for improved accuracy and user experience.

## Features

- Scan documents using the device camera
- Auto/Manual Reshapable selecting indicator polygon during scanning to identify document boundaries accurately
- Auto-capture documents when properly aligned
- Manual capture option for user control
- Import documents from device gallery
- Retake and edit scanned images
- Extract text from scanned images using OCR
- Store scanned documents locally
- View a list of all scanned documents
- View full details of each scanned document
- Delete unwanted documents

## Technologies Used

- Flutter
- Dart
- flutter_bloc for state management
- Hive for local storage
- google_mlkit_document_scanner for document scanning and boundary detection
- google_mlkit_text_recognition for OCR
- image_picker for gallery imports
- image_cropper for image editing

## Getting Started

### Prerequisites

- Flutter SDK (version 2.0 or later)
- Dart SDK (version 2.12 or later)
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/navaneethkrishnaindeed/card_ml_prj.git
   ```

2. Navigate to the project directory:
   ```
   cd card_ml_prj
   ```

3. Get the dependencies:
   ```
   flutter pub get
   ```

4. Run the code generation for Hive and Freezed:
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   ```
   flutter run
   ```

## Usage

1. Launch the app
2. Choose scanning method:
   - Tap the camera icon to scan a new document
   - Tap the gallery icon to import an image from your device
3. When scanning:
   - Align the document within the on-screen guides
   - Reshape the selection polygon if needed for accurate boundary detection
   - Wait for auto-capture or tap the capture button for manual capture
4. After scanning or importing:
   - Review the captured image
   - Retake or edit the image if necessary
   - Proceed to text extraction
5. Review the extracted text and save the document
6. View your scanned documents in the main list
7. Tap on a document to view its details
8. Swipe or tap the delete button to remove a document

## Project Structure

```
lib/
├── main.dart
├── home_bloc.dart
├── scanned_document.dart
├── abstract_scanned_document_repository.dart
├── hive_scanned_document_repository.dart
├── document_list_screen.dart
├── document_scanner_screen.dart
└── document_editor_screen.dart
```

- `main.dart`: Entry point of the application
- `home_bloc.dart`: BLoC for managing app state
- `scanned_document.dart`: Model for scanned documents
- `abstract_scanned_document_repository.dart`: Abstract class for the document repository
- `hive_scanned_document_repository.dart`: Hive implementation of the document repository
- `document_list_screen.dart`: Screen displaying the list of scanned documents
- `document_scanner_screen.dart`: Screen for document scanning with boundary detection
- `document_editor_screen.dart`: Screen for editing scanned images

## Acknowledgments

- Thanks to myairdeal for the task given and the experience with it
- Thanks to the Flutter team and the creators of the third-party packages used in this project

## Contact

If you have any questions, feel free to reach out to Navaneeth Krishna at navaneethkrishnaindeed@gmail.com.