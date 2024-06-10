import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/pages/pet_info_page.dart';

class PetCard extends StatelessWidget {
  final String petType;
  final Map<String, dynamic> pet;

  const PetCard({super.key, required this.pet, required this.petType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetInfoPage(pet: pet),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pet['bgColor'],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 230,
                    ),
                  ),
                  SizedBox(
                    height: 230,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: pet['pic'],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          padding: const EdgeInsets.only(top: 80),
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.yellow[700]!,
                            size: 40,
                          ),
                        ),
                        errorWidget: (context, url, error) => Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Container(
                  decoration: BoxDecoration(
                    color: pet['bgColor']?.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          petType,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.grey[900],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(),
                            Text(
                              "Voir plus >>",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
