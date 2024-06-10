import 'package:flutter/material.dart';
import 'package:pheobe/auth/login_or_register.dart';
import 'package:pheobe/pages/home_page.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.loadUserFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    bool isLoggedIn = userProvider.user == null ? false : true;

    return Scaffold(
      body: isLoggedIn ? const HomePage() : const LoginOrRegister(),
    );
  }
}
