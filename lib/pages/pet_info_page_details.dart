import 'package:flutter/material.dart';

class PetInfoPageDetails extends StatelessWidget {
  final Map<String, dynamic> pet;
  final String question;
  final String number;
  const PetInfoPageDetails(
      {super.key,
      required this.pet,
      required this.question,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
              const SizedBox(height: 30),
              Text(question,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              if (pet['description_$number'] != null) ...[
                Text(pet['description_$number'],
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
              ],
              for (var i = 0; i < pet["list_$number"].length; i++) ...[
                Text(
                  pet["list_$number"][i]
                      .toString(), // Convert item to string to display
                  style: TextStyle(
                    fontSize: i % 2 == 0 ? 20 : 16,
                    color: Colors.black,
                    fontWeight:
                        i % 2 == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                SizedBox(height: i % 2 == 0 ? 5 : 15),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
