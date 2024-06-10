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

class EditPetProfilePage extends StatefulWidget {
  const EditPetProfilePage(
      {super.key, required this.pet, required this.userInfo});
  final Map<String, dynamic> pet;
  final UserModel userInfo;

  @override
  State<EditPetProfilePage> createState() => _EditPetProfilePageState();
}

class _EditPetProfilePageState extends State<EditPetProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController typeVaccineController = TextEditingController();
  bool loading = false;

  final itemsVaccinated = ["Oui", "Non"];
  late String vaccinated;

  Uint8List? petImage;
  File? selectedPetImage;

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

  uploadChanges() async {
    try {
      setState(() {
        loading = true;
      });

      if (selectedPetImage != null) {
        // delete old pet image first
        if (widget.pet["imagePath"] != "") {
          final storageRef = FirebaseStorage.instance.ref();
          final deserRef = storageRef.child(widget.pet["imagePath"]);
          await deserRef.delete();
        }

        final newImagePath =
            "pet_images/${DateTime.now().microsecondsSinceEpoch}.png";
        Reference reference =
            FirebaseStorage.instance.ref().child(newImagePath);
        await reference.putFile(selectedPetImage!).whenComplete(() async {
          String url = await reference.getDownloadURL();
          setState(() {
            widget.pet["picURL"] = url;
            widget.pet["imagePath"] = newImagePath;
          });
        });
      }

      // upload name
      if (nameController.text.isNotEmpty &&
          nameController.text != widget.pet["name"]) {
        setState(() {
          widget.pet["name"] = nameController.text;
        });
      }

      // upload age
      if (ageController.text.isNotEmpty &&
          ageController.text != widget.pet["age"]) {
        setState(() {
          widget.pet["age"] = ageController.text;
        });
      }

      // upload weight
      if (weightController.text.isNotEmpty &&
          weightController.text != widget.pet["weight"]) {
        setState(() {
          widget.pet["weight"] = weightController.text;
        });
      }

      // upload isVaccinated and type
      if (vaccinated != widget.pet["isVaccinated"]) {
        setState(() {
          widget.pet["isVaccinated"] = vaccinated;
        });
        if (widget.pet["vaccine"] == "") {
          setState(() {
            widget.pet["vaccine"] = typeVaccineController.text;
          });
        } else {
          setState(() {
            widget.pet["vaccine"] = "";
          });
        }
      }

      CollectionReference users =
          FirebaseFirestore.instance.collection("users");

      await users.doc(widget.userInfo.id).update(widget.userInfo.toJson());
      Provider.of<UserProvider>(context, listen: false)
          .setUser(widget.userInfo);

      setState(() {
        loading = false;
      });

      Navigator.pop(context, {"res": true, "updatedPet": widget.pet});

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

  deletePetProfile() async {
    try {
      Navigator.pop(context);
      setState(() {
        loading = true;
      });

      // delete pet image from storage first
      final storageRef = FirebaseStorage.instance.ref();
      final deserRef = storageRef.child(widget.pet["imagePath"]);
      await deserRef.delete();

      int count = widget.userInfo.pets
          .where((p) => p["type"] == widget.pet["type"])
          .length;
      if (count == 1) {
        widget.userInfo.petTypes.remove(widget.pet["type"]);
      }
      widget.userInfo.pets.remove(widget.pet);

      CollectionReference users =
          FirebaseFirestore.instance.collection("users");

      await users.doc(widget.userInfo.id).update(widget.userInfo.toJson());
      Provider.of<UserProvider>(context, listen: false)
          .setUser(widget.userInfo);

      setState(() {
        loading = false;
      });

      Navigator.pop(context, {"res": false});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(30),
          backgroundColor: Colors.green[400],
          content: const Text(
            "Supprimé avec succès",
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Êtes-vous sûr de supprimer ce profil ?"),
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
                  deletePetProfile();
                },
                child: const Text("Oui",
                    style: TextStyle(fontSize: 16, color: Colors.red))),
          ],
        ),
      );

  @override
  void initState() {
    vaccinated = widget.pet["isVaccinated"];
    super.initState();
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
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              title: Text(
                "Editer profil de ${widget.pet["name"]}",
                style: TextStyle(
                    fontSize: widget.pet["name"].length > 8 ? 17 : 20),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // body
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // profile picture
                  const Text(
                    "Changer photo du pet",
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

                  const SizedBox(height: 30),

                  // name
                  EditField(
                    element: "Nom",
                    elementController: nameController,
                    obscureText: false,
                    initialValue: widget.pet["name"],
                    textOrDigits: true,
                  ),

                  const SizedBox(height: 20),

                  // age
                  EditField(
                    element: "age",
                    elementController: ageController,
                    obscureText: false,
                    initialValue: widget.pet["age"].toString(),
                    textOrDigits: false,
                  ),

                  const SizedBox(height: 20),

                  // weight
                  EditField(
                    element: "Poids",
                    elementController: weightController,
                    obscureText: false,
                    initialValue: widget.pet["weight"].toString(),
                    textOrDigits: false,
                  ),

                  const SizedBox(height: 20),

                  // isVaccinated
                  const Text(
                    "L'animal est-il vacciné ?",
                    style: TextStyle(fontSize: 20),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
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

                  // if vaccinated show this
                  if (vaccinated == "Oui") ...[
                    const SizedBox(height: 20),
                    const Text("Type de vaccin",
                        style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 10),
                    widget.pet["vaccine"] != ""
                        ? EditField(
                            element: "Type de vaccin",
                            elementController: typeVaccineController,
                            obscureText: false,
                            initialValue: widget.pet["vaccine"],
                            textOrDigits: true)
                        : MyTextField(
                            controller: typeVaccineController,
                            hintText: "Type de vaccinn",
                            obscureText: false,
                            showPadding: false,
                            textOrDigits: true,
                            showKGIcon: false,
                          ),
                  ],

                  const SizedBox(height: 40),

                  // button submit here
                  MyButton(
                    onTap: () {
                      if (selectedPetImage != null ||
                          (nameController.text != "" &&
                              nameController.text != widget.pet["name"]) ||
                          (ageController.text != "" &&
                              ageController.text != widget.pet["age"]) ||
                          (weightController.text != "" &&
                              weightController.text != widget.pet["weight"]) ||
                          (vaccinated == "Oui" &&
                              typeVaccineController.text != "" &&
                              typeVaccineController.text !=
                                  widget.pet["vaccine"])) {
                        uploadChanges();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 1),
                          padding: const EdgeInsets.all(30),
                          backgroundColor: Colors.red[400],
                          content: const Text(
                            "Aucun changement Or Champs manquants",
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
                    onTap: () {
                      openDialog();
                    },
                    text: "Supprimer ce profil",
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
      required this.initialValue,
      required this.textOrDigits});

  final String element;
  final TextEditingController elementController;
  final bool obscureText;
  final String? initialValue;
  final bool textOrDigits;

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
            textOrDigits: textOrDigits,
            showKGIcon: false,
            initialValue: initialValue)
      ],
    );
  }
}
