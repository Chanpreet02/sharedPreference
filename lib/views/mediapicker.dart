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

import 'package:flutter/material.dart';

class filePicker extends StatefulWidget {
  const filePicker({super.key});

  @override
  State<filePicker> createState() => _filePickerState();
}

class _filePickerState extends State<filePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Save as"))
        ]
      ),
    );
  }
}
