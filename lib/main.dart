// ignore_for_file: avoid_print

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pheobe/auth/auth_gate.dart';
import 'package:pheobe/auth/login_or_register.dart';
import 'package:pheobe/pages/home_page.dart';
import 'package:pheobe/pages/login_page.dart';
import 'package:pheobe/pages/profile_page.dart';
import 'package:pheobe/pages/register_page.dart';
import 'package:pheobe/pages/settings_page.dart';
import 'package:pheobe/utils/notifications.dart';
import 'package:pheobe/utils/notifications_controller.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setLanguageCode("fr");
  try {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );
    print("Firebase App Check activated successfully");
  } catch (e) {
    print("Error activating Firebase App Check: $e");
  }

  // initialize notifications
  await initializeNotifications();

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationsController.onActionReceivedMethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Phoebe',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      routes: {
        "/home": (context) => const HomePage(),
        "/login_or_register": (context) => const LoginOrRegister(),
        "/login": (context) => LoginPage(onTap: () {}),
        "/register": (context) => RegisterPage(onTap: () {}),
        "/profile": (context) => const ProfilePage(),
        "/settings": (context) => const SettingsPage(),
      },
    );
  }
}
