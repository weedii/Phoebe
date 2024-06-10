import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/auth/auth_services.dart';
import 'package:pheobe/components/my_button.dart';
import 'package:pheobe/components/my_text_field.dart';
import 'package:pheobe/utils/user_model.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  String showError = "";
  bool loading = false;

  void register() async {
    final authServices = AuthServices();

    if (!mounted) return;
    setState(() {
      showError = "";
    });

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      if (!mounted) return;
      setState(() {
        showError = "Champs manquants !";
      });
      return;
    }
    if (passController.text.length < 8) {
      if (!mounted) return;
      setState(() {
        showError = "Le mot de passe doit comporter au moins 8 caractères!";
      });
      return;
    }
    if (passController.text != confirmPassController.text) {
      if (!mounted) return;
      setState(() {
        showError = "Les mots de passe ne correspondent pas!";
      });
      return;
    }

    if (!mounted) return;
    setState(() {
      loading = true;
    });

    try {
      var res = await authServices.signUpWithEmailAndPass(
        emailController.text,
        passController.text,
      );

      CollectionReference users =
          FirebaseFirestore.instance.collection("users");

      UserModel newUser = UserModel(
        id: res.user?.uid,
        name: nameController.text,
        email: emailController.text,
        picURL: "",
        imagePath: "",
        pets: [],
        petTypes: [],
      );

      await users.doc(res.user?.uid).set(newUser.toJson());

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.setUser(newUser);

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
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: SingleChildScrollView(
            child: loading
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.yellow[700]!,
                    size: 70,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo
                      Icon(Icons.pets, size: 100, color: Colors.yellow[700]),

                      // slogan
                      const SizedBox(height: 25),
                      Text(
                        "Créer un compte",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[700]),
                      ),

                      // name
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: nameController,
                        hintText: "Nom",
                        obscureText: false,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      // email
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      // password
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: passController,
                        hintText: "Mot de passe",
                        obscureText: true,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      // confirm password
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: confirmPassController,
                        hintText: "Confirmez mot de passe",
                        obscureText: true,
                        showPadding: true,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),

                      // error messages
                      if (showError != "") ...[
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
                        )
                      ],

                      // signup button
                      const SizedBox(height: 25),
                      MyButton(onTap: register, text: "S'inscrire"),

                      // not a member? register now
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vous avez déjà un compte?",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Connecte-toi",
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
