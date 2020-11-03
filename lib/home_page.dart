import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  @override
  _ImagePickerClassState createState() => _ImagePickerClassState();
}

class _ImagePickerClassState extends State<ImagePickerClass> {
  File image;
  final picker = ImagePicker();
  Future getMyImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: image == null
                  ? Text('No image selected yet')
                  : Image.file(image),
              height: 300,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Take photo'),
              onPressed: getMyImage,
            ),
            RaisedButton(
              child: Text('Select from gallery'),
              onPressed: getMyImage,
            ),
          ],
        ),
      ),
    );
  }
}
