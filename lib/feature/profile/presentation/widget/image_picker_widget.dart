import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  //1 if camera, 2 if gallery
  final Function(String) onImagePick;
  const ImagePickerWidget({
    Key? key,
    required this.onImagePick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8,),
        const Text('Pick a image'),
        ListTile(
          onTap: () async {
            Navigator.of(context).pop();
            final value = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 40);
            if (value != null) {
              onImagePick(value.path);
            }
          },
          leading: const Icon(Icons.camera),
          title: Text('camera'),
        ),
        ListTile(
          onTap: () async {
            Navigator.of(context).pop();
            final value = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 40);
            if (value != null) {
              onImagePick(value.path);
            }
          },
          leading: const Icon(Icons.photo),
          title: Text('gallery'),
        )
      ],
    );
  }
}