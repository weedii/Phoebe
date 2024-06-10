import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pheobe/auth/auth_gate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthGate()),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "images/icon.png",
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 30),
            Text(
              "P H O E B E",
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
