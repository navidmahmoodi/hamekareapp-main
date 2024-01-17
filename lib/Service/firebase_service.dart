// import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await initializeApp();
//   print("Handling a background message");
// }

// const _option = FirebaseOptions(
//   apiKey: '',
//   appId: '',
//   messagingSenderId: '',
//   projectId: '',
// );

// initializeApp() async {
//   try {
//     await Firebase.initializeApp(options: _option);
//   } catch (e) {
//     Firebase.app();
//   }
// }

// class FirebaseService {
//   /// Create a [AndroidNotificationChannel] for heads up notifications
//   late AndroidNotificationChannel channel;

//   /// Initialize the [FlutterLocalNotificationsPlugin] package.
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   int _messageCount = 0;
//   String? _token;

//   init() async {
//     print("initialize App Firebase");
//     await initializeApp();
//     // Set the background messaging handler early on, as a named top-level function
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//     // FirebaseMessaging.onBackgroundMessage((message) async {
//     //   // await initializeApp();
//     //   print('Handling a background message ${message.messageId}');
//     // });

//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         '12', // id
//         'High Importance Notifications', // title
//         description:
//             'This channel is used for important notifications.', // description,
//         importance: Importance.high,
//       );

//       flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//       /// Create an Android Notification Channel.
//       ///
//       /// We use this channel in the `AndroidManifest.xml` file to override the
//       /// default FCM channel to enable heads up notifications.
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(channel);

//       /// Update the iOS foreground notification presentation options to allow
//       /// heads up notifications.
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//   }

//   /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
//   String constructFCMPayload(String? token) {
//     _messageCount++;
//     return jsonEncode({
//       'token': token,
//       'data': {
//         'via': 'FlutterFire Cloud Messaging!!!',
//         'count': _messageCount.toString(),
//       },
//       'notification': {
//         'title': 'Hello FlutterFire!',
//         'body': 'This notification (#$_messageCount) was created via FCM!',
//       },
//     });
//   }
// }
