import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/components/my_button.dart';
import 'package:pheobe/components/my_text_field.dart';
import 'package:pheobe/utils/user_model.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CreatePetProfilePage extends StatefulWidget {
  const CreatePetProfilePage({super.key, required this.userInfo});
  final UserModel userInfo;

  @override
  State<CreatePetProfilePage> createState() => _CreatePetProfilePageState();
}

class _CreatePetProfilePageState extends State<CreatePetProfilePage> {
  final items = ["Chien", "Poisson", "Chat"];
  String petType = "Chien";
  final itemsVaccinated = ["Oui", "Non"];
  String vaccinated = "Oui";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController typeVaccineController = TextEditingController();

  Uint8List? petImage;
  File? selectedPetImage;
  String? petImageURL;

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
      petImage = File(returnImage.path).readAsBytesSync();
      selectedPetImage = File(returnImage.path);
    });
    Navigator.pop(context);
  }

  Future pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      petImage = File(returnImage.path).readAsBytesSync();
      selectedPetImage = File(returnImage.path);
    });
    Navigator.pop(context);
  }

  uploadImageToFirebase(File image) async {
    try {
      setState(() {
        loading = true;
      });

      // upload image first
      final imagePath =
          "pet_images/${DateTime.now().microsecondsSinceEpoch}.png";
      Reference reference = FirebaseStorage.instance.ref().child(imagePath);
      await reference.putFile(image).whenComplete(() async {
        var uuid = const Uuid();
        String url = await reference.getDownloadURL();

        // now upload petInfo
        if (!widget.userInfo.petTypes.contains(petType)) {
          widget.userInfo.petTypes.add(petType);
        }
        widget.userInfo.pets.add({
          "id": uuid.v1(),
          "type": petType,
          "name": nameController.text,
          "age": ageController.text,
          "weight": weightController.text,
          "isVaccinated": vaccinated,
          "vaccine": vaccinated == "Oui" ? typeVaccineController.text : "",
          "picURL": url,
          "imagePath": imagePath
        });

        CollectionReference users =
            FirebaseFirestore.instance.collection("users");

        await users.doc(widget.userInfo.id).update(widget.userInfo.toJson());

        if (!mounted) return;
        Provider.of<UserProvider>(context, listen: false)
            .setUser(widget.userInfo);

        setState(() {
          loading = false;
        });
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(30),
            backgroundColor: Colors.green[400],
            content: const Text(
              "Enregistré avec succès",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );

        return;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            backgroundColor: Colors.grey[100],
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
              title: const Text("Créez un profil pour votre pet"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sélectionner le type d'animal",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconEnabledColor: Colors.yellow[800],
                            value: petType,
                            items: items.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              setState(() {
                                petType = val!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // image input here
                      const Text("Ajouter une photo (optionelle)",
                          style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 10),

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
                          child: petImage != null
                              ? Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: MemoryImage(petImage!),
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            petImage = null;
                                            selectedPetImage = null;
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

                      const SizedBox(height: 20),

                      const Text("Nom du pet", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: nameController,
                        hintText: "Nom",
                        obscureText: false,
                        showPadding: false,
                        textOrDigits: true,
                        showKGIcon: false,
                      ),
                      const SizedBox(height: 20),
                      const Text("Age du pet", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: ageController,
                        hintText: "Age",
                        obscureText: false,
                        showPadding: false,
                        textOrDigits: false,
                        showKGIcon: false,
                      ),
                      const SizedBox(height: 20),
                      const Text("Poids du pet",
                          style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: weightController,
                        hintText: "Poids",
                        obscureText: false,
                        showPadding: false,
                        textOrDigits: false,
                        showKGIcon: true,
                      ),

                      const SizedBox(height: 20),

                      // is vaccinated
                      const Text(
                        "L'animal est-il vacciné ?",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconEnabledColor: Colors.yellow[800],
                            value: vaccinated,
                            items: itemsVaccinated.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              setState(() {
                                vaccinated = val!;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // if vaccinated show this
                      if (vaccinated == "Oui") ...[
                        const Text("Type de vaccin",
                            style: TextStyle(fontSize: 15)),
                        const SizedBox(height: 10),
                        MyTextField(
                          controller: typeVaccineController,
                          hintText: "Type de vaccin",
                          obscureText: false,
                          showPadding: false,
                          textOrDigits: true,
                          showKGIcon: false,
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ...
                  MyButton(
                    onTap: () async {
                      if (selectedPetImage == null ||
                          nameController.text.isEmpty ||
                          ageController.text.isEmpty ||
                          weightController.text.isEmpty ||
                          (vaccinated == "Oui" &&
                              typeVaccineController.text.isEmpty)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 1),
                            padding: const EdgeInsets.all(30),
                            backgroundColor: Colors.red[400],
                            content: const Text(
                              "Champs manquants",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                        return;
                      } else {
                        await uploadImageToFirebase(selectedPetImage!);
                      }
                    },
                    text: "Créer un profil",
                    showMargin: "no margin",
                  ),
                ],
              ),
            ),
          );
  }
}
