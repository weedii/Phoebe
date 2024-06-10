import 'package:flutter/material.dart';

class AdvicesPage extends StatelessWidget {
  final String head;
  final String number;
  final Map<String, dynamic> pet;

  const AdvicesPage(
      {super.key, required this.head, required this.pet, required this.number});

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
              Text(head,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              for (var i = 0; i < pet["advice_lst_$number"].length; i++) ...[
                Text(
                  pet["advice_lst_$number"][i]
                      .toString(), // Convert item to string to display
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
