import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String photoUrl;

  const ProfilePage({super.key,
  required this.name,
  required this.email,
  required this.photoUrl
  });


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView(

        children: [
          Row(
            children: [
              CircleAvatar(
                radius:40.0,
                backgroundImage: NetworkImage(photoUrl),
              ),
              SizedBox(width: 16.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize:20.0)),
                  Text(name, style: TextStyle(fontSize:10.0)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
