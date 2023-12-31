import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/notifications/handle_notifications.dart';
import 'package:news_app/config/notifications/local_notification_manager.dart';
import 'package:news_app/feature/Dashboard/dashboard_one.dart';
//import 'package:news_app/config/notifications/local_notifications_manager.dart';
import 'package:news_app/feature/auth/presentation/login_page.dart';
import 'package:news_app/feature/news/presentation/all_news.dart';
import 'package:news_app/feature/news/presentation/news_page.dart';
import 'package:news_app/feature/profile/presentation/profile.dart';
//import 'package:news_app/test.dart';
import 'package:upgrader/upgrader.dart';

//import 'config/network/handle_notifications.dart';
//import 'feature/profile/presentation/profile.dart';
//import 'feature/auth/presentation/profile.dart';

void main() {

  intializeApp();

  runApp(const MyApp());
}

Future<void> intializeApp() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///11. for notifications
// LocalNotificationManager.initialize();

  HandleNotifications.registerBackgroundMessageHandler();

  HandleNotifications.notificationMethods();

  HandleNotifications.handleNotification();

  ///Initialize crashlytics

  handleCrashAnalystics();
}

void handleCrashAnalystics(){
  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: ScreenUtilInit(
        designSize: Size(428, 920),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (BuildContext context, Widget? child) {

          return  MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home:Profile (
              name:"Saphal Rai",
              email:'saphalrai53@gmail.com',
              photoUrl: '',
            ),
            // home: DashboardOne(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {

    print("Counter :${_counter++}");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print("Inside the build method");

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Future async await
//c3a61af9631548308c50deb4727a9669