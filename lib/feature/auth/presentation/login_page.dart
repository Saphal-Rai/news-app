import 'package:flutter/material.dart';
import 'package:news_app/feature/auth/domain/login_ctrl.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Google Login Page"),

          ElevatedButton(
            onPressed: () {
              LoginCtrl.goToGoogleLogin(context);
            },
            child: Text('Button'),
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              LoginCtrl.goToFacebookLogin(context);
            },
            child: Text('Facebbook'),
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
