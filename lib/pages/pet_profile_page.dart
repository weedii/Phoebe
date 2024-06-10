import 'package:flutter/material.dart';
import 'package:pheobe/components/my_button.dart';
import 'package:pheobe/components/my_sliver_app_bar.dart';
import 'package:pheobe/components/question_card.dart';
import 'package:pheobe/pages/edit_pet_profile_page.dart';
import 'package:pheobe/utils/user_model.dart';

// ignore: must_be_immutable
class PetProfilePage extends StatefulWidget {
  PetProfilePage(
      {super.key,
      required this.pet,
      required this.petInfoDB,
      required this.userInfo});

  Map<String, dynamic> pet;
  final Map<String, dynamic> petInfoDB;
  final UserModel userInfo;

  @override
  State<PetProfilePage> createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController typeVaccineController = TextEditingController();

  final itemsVaccinated = ["Oui", "Non"];

  late String initialVaccinated;
  late String vaccinated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: "${widget.pet["name"]} Profile",
            heightt: 600,
            pic: "${widget.pet["picURL"]}",
            bgColor: Colors.white,
            picCoverContain: true,
            showArrowBack: true,
            showProfileIcon: false,
          )
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              PetInfoElement(
                attributeText: "Nom",
                attribute: widget.pet["name"],
              ),

              const SizedBox(height: 25),

              PetInfoElement(
                attributeText: "Age",
                attribute: widget.pet["age"].toString(),
              ),

              const SizedBox(height: 25),

              PetInfoElement(
                attributeText: "Poids(kg)",
                attribute: widget.pet["weight"].toString(),
              ),

              const SizedBox(height: 25),

              PetInfoElement(
                attributeText: "L'animal est-il vacciné ?",
                attribute: widget.pet["isVaccinated"].toString(),
              ),

              // if is vaccinated
              if (widget.pet["isVaccinated"] == "Oui") ...[
                const SizedBox(height: 25),
                PetInfoElement(
                  attributeText: "L'animal est-il vacciné ?",
                  attribute: widget.pet["vaccine"],
                ),
              ],

              const SizedBox(height: 30),

              MyButton(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPetProfilePage(
                        pet: widget.pet,
                        userInfo: widget.userInfo,
                      ),
                    ),
                  );
                  if (result != null && result["res"] == true) {
                    setState(() {
                      // Update the pet data with the returned updated pet data
                      widget.pet = result["updatedPet"];
                    });
                  }
                  if (result != null && result["res"] == false) {
                    Navigator.pop(context);
                  }
                },
                text: "Editer le profil",
                showMargin: "no margin",
              ),

              // other info about the pet
              const SizedBox(height: 100),
              Text(
                "Voir plus d'informations",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              if (widget.petInfoDB['title_1'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_1'],
                    pet: widget.petInfoDB,
                    number: '1',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['title_2'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_2'],
                    pet: widget.petInfoDB,
                    number: '2',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['title_3'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_3'],
                    pet: widget.petInfoDB,
                    number: '3',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['title_4'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_4'],
                    pet: widget.petInfoDB,
                    number: '4',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['title_5'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_5'],
                    pet: widget.petInfoDB,
                    number: '5',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['title_6'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['title_6'],
                    pet: widget.petInfoDB,
                    number: '6',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['advice_lst_title_1'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['advice_lst_title_1'],
                    pet: widget.petInfoDB,
                    number: '1',
                    advice: true),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['advice_lst_title_2'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['advice_lst_title_2'],
                    pet: widget.petInfoDB,
                    number: '2',
                    advice: true),
                const SizedBox(height: 20),
              ],
              if (widget.petInfoDB['advice_lst_title_3'] != null) ...[
                QuestionCard(
                    question: widget.petInfoDB['advice_lst_title_3'],
                    pet: widget.petInfoDB,
                    number: '3',
                    advice: true),
                const SizedBox(height: 20),
              ],
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PetInfoElement extends StatefulWidget {
  const PetInfoElement({
    super.key,
    required this.attributeText,
    required this.attribute,
  });

  final String attributeText;
  final String attribute;

  @override
  State<PetInfoElement> createState() => _PetInfoElementState();
}

class _PetInfoElementState extends State<PetInfoElement> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.attributeText,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 10),
      Text(
        widget.attribute,
        style: const TextStyle(fontSize: 20),
      ),
    ]);
  }
}
