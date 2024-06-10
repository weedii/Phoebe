import 'package:flutter/material.dart';
import 'package:pheobe/pages/advices_page.dart';
import 'package:pheobe/pages/pet_info_page_details.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String number;
  final bool advice;
  final Map<String, dynamic> pet;

  const QuestionCard(
      {super.key,
      required this.question,
      required this.pet,
      required this.number,
      required this.advice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => advice
                ? AdvicesPage(head: question, pet: pet, number: number)
                : PetInfoPageDetails(
                    pet: pet,
                    question: question,
                    number: number,
                  ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Expanded(child: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
