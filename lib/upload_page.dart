import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _imageFile;
  //pick image
  Future? pickImage() async {
    //picker
    final ImagePicker picker = ImagePicker();

    //pick from gallery

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  //upload
  Future uploadImage() async {
    if (_imageFile == null) return;

    //generate a unique file path
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    final path = 'uploads/$fileName';

    //upload the image to supabase storage
    await Supabase.instance.client.storage
        .from('images')
        .upload(path, _imageFile!)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("image uploaded sucessful!"))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("upload page"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            //image preview
            _imageFile != null
                ? Image.file(_imageFile!)
                : const Text("No Image selected"),

            //pick image button
            ElevatedButton(
                onPressed: pickImage, child: const Text("Pick image")),

            //upload button
            ElevatedButton(onPressed: uploadImage, child: const Text('Upload'))
          ],
        ),
      ),
    );
  }
}
