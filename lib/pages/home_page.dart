import 'package:flutter/material.dart';
import 'package:pheobe/components/my_drawer.dart';
import 'package:pheobe/components/my_sliver_app_bar.dart';
import 'package:pheobe/components/pet_card.dart';
import 'package:pheobe/utils/pet_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (args != null && args["showDialog"] == true) {
        final shouldNavigateBack = await showMyDialog(args["data"]);
        if (shouldNavigateBack == true) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  Future<bool> showMyDialog(Map<String, dynamic> data) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(
              data["title"],
              style: TextStyle(
                  color: Colors.yellow[800], fontWeight: FontWeight.w500),
            ),
            content: Text(
              data["body"],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: [
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.yellow[800]),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: "P H O E B E",
            heightt: 300,
            pic:
                "https://firebasestorage.googleapis.com/v0/b/phoebe-d60af.appspot.com/o/dc.jpg?alt=media&token=144f4fab-c50c-4c75-a57d-5ef3477ebd7d",
            bgColor: Colors.yellow[600],
            picCoverContain: true,
            showArrowBack: false,
            showProfileIcon: true,
          )
        ],
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Plus",
                    style: TextStyle(fontSize: 30, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      PetCard(
                        petType: "Chiens",
                        pet: dogInfo,
                      ),
                      const SizedBox(height: 25),
                      PetCard(
                        petType: "Poissons",
                        pet: fishInfo,
                      ),
                      const SizedBox(height: 25),
                      PetCard(
                        petType: "Chats",
                        pet: catInfo,
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
