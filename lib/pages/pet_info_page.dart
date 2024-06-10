import 'package:flutter/material.dart';
import 'package:pheobe/components/my_sliver_app_bar.dart';
import 'package:pheobe/components/question_card.dart';

class PetInfoPage extends StatelessWidget {
  final Map<String, dynamic> pet;

  const PetInfoPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: pet['type'],
            heightt: 600,
            pic: pet['pic'],
            bgColor: pet['bgColor'],
            picCoverContain: false,
            showArrowBack: true,
            showProfileIcon: false,
          )
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                pet['type'],
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              if (pet['title_1'] != null) ...[
                QuestionCard(
                    question: pet['title_1'],
                    pet: pet,
                    number: '1',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['title_2'] != null) ...[
                QuestionCard(
                    question: pet['title_2'],
                    pet: pet,
                    number: '2',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['title_3'] != null) ...[
                QuestionCard(
                    question: pet['title_3'],
                    pet: pet,
                    number: '3',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['title_4'] != null) ...[
                QuestionCard(
                    question: pet['title_4'],
                    pet: pet,
                    number: '4',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['title_5'] != null) ...[
                QuestionCard(
                    question: pet['title_5'],
                    pet: pet,
                    number: '5',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['title_6'] != null) ...[
                QuestionCard(
                    question: pet['title_6'],
                    pet: pet,
                    number: '6',
                    advice: false),
                const SizedBox(height: 20),
              ],
              if (pet['advice_lst_title_1'] != null) ...[
                QuestionCard(
                    question: pet['advice_lst_title_1'],
                    pet: pet,
                    number: '1',
                    advice: true),
                const SizedBox(height: 20),
              ],
              if (pet['advice_lst_title_2'] != null) ...[
                QuestionCard(
                    question: pet['advice_lst_title_2'],
                    pet: pet,
                    number: '2',
                    advice: true),
                const SizedBox(height: 20),
              ],
              if (pet['advice_lst_title_3'] != null) ...[
                QuestionCard(
                    question: pet['advice_lst_title_3'],
                    pet: pet,
                    number: '3',
                    advice: true),
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
