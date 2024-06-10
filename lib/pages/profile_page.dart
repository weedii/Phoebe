import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pheobe/pages/create_pet_profile_page.dart';
import 'package:pheobe/pages/edit_user_profile_page.dart';
import 'package:pheobe/pages/pet_profile_page.dart';
import 'package:pheobe/utils/pet_models.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.loadUserFromPrefs();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context).user;

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
              title: const Text("Profil"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: userInfo == null
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.yellow[700]!,
                      size: 70,
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: userInfo.picURL != ""
                                  ? CachedNetworkImage(
                                      imageUrl: userInfo.picURL,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color: Colors.yellow[100],
                                        child: Center(
                                          child: LoadingAnimationWidget
                                              .staggeredDotsWave(
                                            color: Colors.yellow[800]!,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Icon(
                                          Icons.error,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: Colors.yellow[700],
                                      child: const Icon(
                                        Icons.person,
                                        size: 70,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            userInfo.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userInfo.email,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditUserProfilePage(
                                            userInfo: userInfo,
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[700],
                              ),
                              child: const Text(
                                "Editer le profil",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 10),
                          const Text("Mes pets",
                              style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 10),
                          for (var pet in userInfo.pets) ...[
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PetProfilePage(
                                      pet: pet,
                                      petInfoDB: pet["type"] == "Chien"
                                          ? dogInfo
                                          : pet["type"] == "Poisson"
                                              ? fishInfo
                                              : catInfo,
                                      userInfo: userInfo,
                                    ),
                                  ),
                                );
                              },
                              child: ProfileMenuWidget(
                                petName: pet["name"],
                                petPicURL: pet["picURL"],
                              ),
                            ),
                          ],
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CreatePetProfilePage(userInfo: userInfo),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue.withOpacity(0.2),
                                ),
                                child: Icon(Icons.add, color: Colors.blue[800]),
                              ),
                              title: const Text(
                                "Créez un profil pour votre pet",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.petName,
    required this.petPicURL,
  });

  final String petName;
  final String petPicURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.yellow.withOpacity(0.2),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: petPicURL,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.yellow[100],
                child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.yellow[700]!,
                    size: 20,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          petName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
