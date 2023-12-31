import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/feature/auth/presentation/profile_page.dart';

class LoginCtrl{


 static Future goToGoogleLogin(BuildContext context) async{

    var googleSignIn = GoogleSignIn().signIn();
    Future<GoogleSignInAccount?> googleSignInAccount = googleSignIn;

    final Value = await googleSignInAccount;
    final googleKey = await Value?. authentication;
    String? accessToken = googleKey?. accessToken.toString();

    // We need to sent this accessToken to backend
    print ("Email : ${Value?.email??''}");
    print ("Display Name : ${Value?.displayName??''}");
    print ("AccessToken : ${accessToken??''}");

    if(accessToken !=null){
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => ProfilePage(name:
          Value?.displayName??'',
              email: Value?.email??'',
              photoUrl: Value?.photoUrl??''
      )
      )
      );
    }



  }

  static Future goToFacebookLogin(BuildContext context) async{

   final LoginResult result = await FacebookAuth.instance.login(
     permissions: ['public_profile', 'email']
   );

   if (result.status == LoginStatus.success){
     print("Login Success");
   }
   else{
     print("Login Fail");
   }
  }

}