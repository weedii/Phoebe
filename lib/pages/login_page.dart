import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pheobe/auth/auth_services.dart';
import 'package:pheobe/components/my_button.dart';
import 'package:pheobe/components/my_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/utils/user_model.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String showError = "";
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void login() async {
    final authServices = AuthServices();

    setState(() {
      showError = "";
    });

    if (emailController.text.isEmpty || passController.text.isEmpty) {
      setState(() {
        showError = "Champs manquants !";
      });
      return;
    }

    setState(() {
      loading = true;
    });
    try {
      var res = await authServices.signInWithEmailAndPass(
        emailController.text,
        passController.text,
      );

      var userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(res.user?.uid)
          .get();

      UserModel userInfo = UserModel(
        id: userDoc["id"],
        name: userDoc["name"],
        email: userDoc["email"],
        picURL: userDoc["picURL"],
        imagePath: userDoc["imagePath"],
        pets: userDoc["pets"],
        petTypes: userDoc["petTypes"],
      );

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.setUser(userInfo);

      setState(() {
        loading = false;
      });

      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      if (!mounted) return;

      setState(() {
        showError = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: loading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.yellow[700]!,
                  size: 70,
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo
                      Icon(Icons.pets, size: 100, color: Colors.yellow[700]),

                      const SizedBox(height: 25),

                      // slogan
                      Text(
                        "P H O E B E",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // email
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      const SizedBox(height: 25),

                      // password
                      MyTextField(
                        controller: passController,
                        hintText: "Mot de passe",
                        obscureText: true,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      // error messages
                      if (showError.isNotEmpty) ...[
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            showError,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],

                      // signin button
                      const SizedBox(height: 25),
                      MyButton(
                        onTap: login,
                        text: "Sign In",
                      ),

                      const SizedBox(height: 25),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pas un membre?",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
