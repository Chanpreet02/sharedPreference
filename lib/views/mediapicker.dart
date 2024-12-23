/*

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class MediaPicker extends StatefulWidget {
  const MediaPicker({super.key});

  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {
  // List<MediaFile> _selectedFiles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildUI(),
          _buttonImage(),

        ],
      )
    );
  }

  Widget _buildUI(){
    return Center(
      child: Container(
        color: Colors.black,
        child:Text("This is media picker", style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _buttonImage(){
    return FloatingActionButton(onPressed: () async {
      List<MediaFile> mediaFiles = await GalleryPicker.pickMedia(context: context, singleMedia: false) ?? [];
    }, child: const Icon(Icons.image),);
  }

}
*/

/*
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  Uint8List? _imageBytes;
  File? _imageFile;

  // Function to open file picker and select an image
  Future<void> _pickImage() async {
    // Pick a single image file (image only)
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Specify that we want to pick an image
    );

    if (result != null) {
      // Check if the platform is Web or Android
      if (kIsWeb) {
        // For Web, get the bytes of the selected image
        setState(() {
          _imageBytes = result.files.single.bytes; // Store the selected image bytes
          _imageFile = null; // Nullify the file (since it's web)
        });
      } else {
        // For Android, get the file path of the selected image
        setState(() {
          _imageFile = File(result.files.single.path!); // Store the selected image file
          _imageBytes = null; // Nullify the bytes (since it's Android)
        });
      }
    } else {
      // If user cancels the picker, reset both imageBytes and imageFile to null
      setState(() {
        _imageBytes = null;
        _imageFile = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage, // Trigger file picker
              child: Text("Upload an Image"),
            ),
            SizedBox(height: 20),
            // Display the picked image or a placeholder text
            _imageFile != null
                ? SizedBox(
              width: screenWidth * 0.5, // 50% of screen width
              height: screenHeight * 0.3, // 30% of screen height
              child: Image.file(
                _imageFile!,
                ),
            )
                : _imageBytes != null
                ? SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.3,
              child: Image.memory(
                _imageBytes!,
                ),
            )
                : Text("No image selected"),
          ],
        ),
      ),
    );
  }
}
*/