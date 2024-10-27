// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:overlay_support/overlay_support.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'Screens/login screen/login_screen.dart';
// // import 'Screens/Notification/push_notification.dart';
// // import 'Screens/Notification/notification_screen.dart';

// // List<PushNotification> notificationList = []; // Global notification list

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");

//   // PushNotification notification = PushNotification(
//   //   title: message.notification?.title ?? '',
//   //   body: message.notification?.body ?? '',
//   //   dataTitle: message.data['title'] ?? '',
//   //   dataBody: message.data['body'] ?? '',
//   //   arrivalTime: DateTime.now(),
//   // );

//   // Add the notification to the global list
//   //notificationList.add(notification);
//  // print("Background notification added: ${notification.title}");
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   User? user;
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   @override
//   void initState() {
//     super.initState();

//     // Get the FCM token
//     user = FirebaseAuth.instance.currentUser;
//     _firebaseMessaging.getToken().then((token) {
//       print("Firebase Token: $token");
//     });

//     // Listen for foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _handleNotification(message);
//     });

//     // Listen for background messages when the app is opened
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _handleNotification(message, navigateToScreen: true);
//     });
//   }

//   void _handleNotification(RemoteMessage message,
//       {bool navigateToScreen = false}) {
//    // PushNotification notification = PushNotification(
//     //  title: message.notification?.title ?? '',
//     //  body: message.notification?.body ?? '',
//      // dataTitle: message.data['title'] ?? '',
//      // dataBody: message.data['body'] ?? '',
//      // arrivalTime: DateTime.now(),
//    // );

//     // Store the notification in the list
//     setState(() {
//      // notificationList.add(notification);
//     //  notificationList.sort((a, b) => a.arrivalTime.compareTo(b.arrivalTime));
//     });

//     print(
//        // "Foreground notification added: ${notification.title} at ${notification.arrivalTime}");

//     // Show notification in overlay (optional)
//     showSimpleNotification(
//     //  Text(notification.title),
//       //subtitle: Text(notification.body),
//       background: Colors.blue,
//     );

//     // Check if user is logged in before navigating
//     if (navigateToScreen && user != null) {
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) => NotificationScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OverlaySupport(
//       child: GetMaterialApp(
//         title: 'Ecommerce App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const LoginScreen(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }
