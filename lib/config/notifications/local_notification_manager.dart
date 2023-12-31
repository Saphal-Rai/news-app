//import 'dart:html';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager{

  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static NotificationDetails notificationDetails = const NotificationDetails();

  static String channelID = 'general';
  static String channelName = 'General';
  static String channelDescription= 'Notifications from the login_screen';

  void initialize(){

    /*
  * 5. Requesting Permission*/
    requestPermission();

    //Initialize platform
    initializePlatform();
  }

  void requestPermission(){

    if(Platform.isIOS){
      requestIOSPermission();
    }
    else if(Platform.isAndroid){
      requestAndroidPermission();

    }
  }

  void initializePlatform(){

    //Initialing Android and IOS settings
    InitializationSettings initializationSettings = const InitializationSettings(

      // Give the name of icon in android
      android: AndroidInitializationSettings("drawable/logo"),

    );

    _notificationsPlugin.initialize(initializationSettings);

    getNotificationDetails(null);
  }

  //5.a.TODO Request IOS permission
  void requestIOSPermission() {}

  //5.b.
  Future<void> requestAndroidPermission() async {

    // this plugin is giving the android sdk version info
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    int? sdk = androidInfo.version.sdkInt;

    /*
    * flutter_local_notification handles permission for notification
    * when sdk>33
    * */

    if (sdk>=33){

      _notificationsPlugin.
      resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }

    /** On Android devices with an SDK level less than 33 (Android 12) by
     * requesting the necessary permissions automatically when you use the
     * show method to display a notification. */

  }

 static Future<NotificationDetails> getNotificationDetails(RemoteMessage? message) async{

   notificationDetails = NotificationDetails(
   android: await androidNotificationDetails(message)
   );
   return notificationDetails;
  }
  static Future<AndroidNotificationDetails> androidNotificationDetails(RemoteMessage?  message) async {
    String imageUrl = message?.notification?.android?.imageUrl ?? '';
    /*String soundFileName = message?.notification?.android?.sound ?? '';
    final String? imageData = await fetchImage(imageUrl);
    */
    return AndroidNotificationDetails(
      //Channel ID,
        channelID,
        // Channel Name
        channelName,
        channelDescription: channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        fullScreenIntent: true,
        playSound: true,
        /*TODO For Sound in Notifications*/
        // sound: RawResourceAndroidNotificationSound(soundFileName),
        icon: 'drawable/logo',
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
       /* styleInformation: BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(imageData ?? ''))
   */ );
  }


  //13
   static Future<void> createNDisplayNotification(RemoteMessage? message) async {
     try {
       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
       await _notificationsPlugin.show(
         id,
          message?.notification?.title ?? '',
          message?.notification?.body ?? '',
          await getNotificationDetails(message),
    // await getNotificationDetails(message),
          payload: message?.data['_id'],
    );
     } on Exception catch (e)
    {
      print("Notification  Error : $e");  }}
}
