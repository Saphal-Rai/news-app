import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/core/methods/app_methods.dart';

import 'widget/image_picker_widget.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final String photoUrl;

  const Profile({super.key,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // XFile? file;
  String? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                          AppMethods.showFlexibleSizeBottomSheet(
                              widget: ImagePickerWidget(onImagePick: (String value) {

                                setState(() {
                                  filePath = value;
                                });
                              },),
                              context:context,
                              isScrollable:false);

                        },
                        child: CircleAvatar(
                          radius: 40.0,

                          backgroundImage: filePath!=null
                              ? Image.file(File(filePath!)).image
                              : NetworkImage(widget.photoUrl),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle(fontSize: 20.0)),
                          Text(widget.email, style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}