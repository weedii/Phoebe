import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/auth/auth_services.dart';
import 'package:pheobe/components/my_button.dart';
import 'package:pheobe/components/my_text_field.dart';
import 'package:pheobe/utils/user_model.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class EditUserProfilePage extends StatefulWidget {
  const EditUserProfilePage({super.key, required this.userInfo});
  final UserModel userInfo;

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  Uint8List? userImage;
  File? selectedUserImage;
  String? userImageURL;

  bool loading = false;

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 70,
                              color: Colors.yellow[700],
                            ),
                            const Text("Gallery",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 70,
                              color: Colors.yellow[700],
                            ),
                            const Text("Camera",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      userImage = File(returnImage.path).readAsBytesSync();
      selectedUserImage = File(returnImage.path);
    });
    Navigator.pop(context);
  }

  Future pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      userImage = File(returnImage.path).readAsBytesSync();
      selectedUserImage = File(returnImage.path);
    });
    Navigator.pop(context);
  }

  uploadChanges() async {
    try {
      setState(() {
        loading = true;
      });

      // upload image
      if (selectedUserImage != null) {
        // delete old pet image first
        if (widget.userInfo.imagePath != "") {
          final storageRef = FirebaseStorage.instance.ref();
          final deserRef = storageRef.child(widget.userInfo.imagePath);
          await deserRef.delete();
        }

        final newImagePath =
            "users_images/${DateTime.now().microsecondsSinceEpoch}.png";
        Reference reference =
            FirebaseStorage.instance.ref().child(newImagePath);
        await reference.putFile(selectedUserImage!).whenComplete(() async {
          String url = await reference.getDownloadURL();
          setState(() {
            widget.userInfo.picURL = url;
            widget.userInfo.imagePath = newImagePath;
          });
        });
      }

      // // upload email
      // if (emailController.text.isNotEmpty &&
      //     emailController.text != widget.userInfo.email) {
      //   final authServices = AuthServices();
      //   await authServices.updateEmail(emailController.text, "12345678");
      //   setState(() {
      //     updatedEmail = emailController.text;
      //   });
      //   widget.userInfo.email = emailController.text;
      //   CollectionReference users =
      //       FirebaseFirestore.instance.collection("users");

      //   await users.doc(widget.userInfo.id).update(widget.userInfo.toJson());
      //   await authServices.signOut();
      //   Provider.of<UserProvider>(context, listen: false).clearUser();
      // }

      // upload password
      if (oldPasswordController.text != "") {
        if (newPasswordController.text != "" &&
            newPasswordController.text.length < 8) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            padding: const EdgeInsets.all(30),
            backgroundColor: Colors.red[400],
            content: const Text(
              "Le mot de passe doit comporter au moins 8 caractères!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
          //
        } else {
          final authServices = AuthServices();
          await authServices.updatePassword(
              oldPasswordController.text, newPasswordController.text);
          await authServices.signOut();
          Provider.of<UserProvider>(context, listen: false).clearUser();
          Navigator.pushReplacementNamed(context, "/login_or_register");
          return;
        }
      }

      // upload name
      if (nameController.text.isNotEmpty &&
          nameController.text != widget.userInfo.name) {
        setState(() {
          widget.userInfo.name = nameController.text;
        });
      }

      CollectionReference users =
          FirebaseFirestore.instance.collection("users");

      await users.doc(widget.userInfo.id).update(widget.userInfo.toJson());
      Provider.of<UserProvider>(context, listen: false)
          .setUser(widget.userInfo);

      setState(() {
        loading = false;
      });

      Navigator.pop(context);

      return;
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          padding: const EdgeInsets.all(30),
          backgroundColor: Colors.red[400],
          content: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  deleteUserAccount() async {
    final authServices = AuthServices();

    try {
      Navigator.pop(context);
      setState(() {
        loading = true;
      });

      // delete user image
      if (widget.userInfo.imagePath != "") {
        final storageRef = FirebaseStorage.instance.ref();
        final deserRef = storageRef.child(widget.userInfo.imagePath);
        await deserRef.delete();
      }

      // delete pet images
      if (widget.userInfo.pets.isNotEmpty) {
        for (final pet in widget.userInfo.pets) {
          if (pet["imagePath"] != "") {
            final storageRef = FirebaseStorage.instance.ref();
            final deserRef = storageRef.child(pet["imagePath"]);
            await deserRef.delete();
          }
        }
      }

      // delete user data from DB
      CollectionReference users =
          FirebaseFirestore.instance.collection("users");
      await users.doc(widget.userInfo.id).delete();

      // delete user account
      await authServices.deleteUserAccount(confirmPasswordController.text);

      // finally signout and clear storage
      await authServices.signOut();
      Provider.of<UserProvider>(context, listen: false).clearUser();
      Navigator.pushReplacementNamed(context, "/login_or_register");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          padding: const EdgeInsets.all(30),
          backgroundColor: Colors.green[400],
          content: const Text(
            "Compte supprimé avec succès",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );

      return;
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          padding: const EdgeInsets.all(30),
          backgroundColor: Colors.red[400],
          content: Text(
            "$e",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
      confirmPasswordController.text = "";
      return;
    }
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Êtes-vous sûr de supprimer ce compte ?"),
          content: MyTextField(
              autoFocus: true,
              controller: confirmPasswordController,
              hintText: "Mot de passe",
              obscureText: true,
              showPadding: false,
              textOrDigits: true,
              showKGIcon: false),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Annuler",
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                )),
            TextButton(
                onPressed: () {
                  if (confirmPasswordController.text != "") {
                    deleteUserAccount();
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 5),
                        padding: EdgeInsets.all(30),
                        backgroundColor: Colors.red,
                        content: Text(
                          "Mot de passe requis",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Oui",
                    style: TextStyle(fontSize: 16, color: Colors.red))),
          ],
        ),
      );

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            body: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.yellow[700]!,
                size: 70,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              title: const Text("Editer le profil"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // profile picture
                  const Text(
                    "Changer photo de profile",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      showImagePickerOption(context);
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: userImage != null
                          ? Stack(
                              children: [
                                CircleAvatar(
                                  radius: 100,
                                  backgroundImage: MemoryImage(userImage!),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        userImage = null;
                                        selectedUserImage = null;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: const Icon(Icons.close,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 50,
                              color: Colors.yellow[900],
                            ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // name
                  EditField(
                    element: "Nom",
                    elementController: nameController,
                    obscureText: false,
                    initialValue: widget.userInfo.name,
                  ),

                  const SizedBox(height: 30),

                  // password
                  EditField(
                    element: "Ancien mot de passe",
                    elementController: oldPasswordController,
                    obscureText: true,
                    initialValue: null,
                  ),

                  const SizedBox(height: 20),

                  EditField(
                    element: "Mot de passe",
                    elementController: newPasswordController,
                    obscureText: true,
                    initialValue: null,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  // button submit here
                  MyButton(
                    onTap: () {
                      if (selectedUserImage != null ||
                          (nameController.text.isNotEmpty &&
                              nameController.text != widget.userInfo.name) ||
                          newPasswordController.text != "") {
                        uploadChanges();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 1),
                          padding: const EdgeInsets.all(30),
                          backgroundColor: Colors.red[400],
                          content: const Text(
                            "Aucun changement",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ));
                      }
                    },
                    text: "Enregistrer les modifications",
                    showMargin: "no margin",
                  ),

                  const SizedBox(height: 20),

                  MyButton(
                    onTap: () async {
                      openDialog();
                    },
                    text: "Supprimer le compte",
                    showMargin: "no margin",
                    bgColor: Colors.red,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
  }
}

class EditField extends StatelessWidget {
  const EditField(
      {super.key,
      required this.element,
      required this.elementController,
      required this.obscureText,
      required this.initialValue});

  final String element;
  final TextEditingController elementController;
  final bool obscureText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(element, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        MyTextField(
            controller: elementController,
            hintText: element,
            obscureText: obscureText,
            showPadding: false,
            textOrDigits: true,
            showKGIcon: false,
            initialValue: initialValue)
      ],
    );
  }
}
