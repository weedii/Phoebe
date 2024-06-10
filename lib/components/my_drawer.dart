import 'package:flutter/material.dart';
import 'package:pheobe/auth/auth_services.dart';
import 'package:pheobe/components/my_drawer_tile.dart';
import 'package:pheobe/utils/user_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.pets,
              size: 80,
              color: Colors.yellow[700],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Colors.grey[700],
            ),
          ),

          // home list tile
          MyDrawerTile(
              text: "Home",
              icon: Icons.home_outlined,
              onTap: () {
                Navigator.pop(context);
              }),

          // profile list tile
          MyDrawerTile(
              text: "Profil",
              icon: Icons.account_circle_outlined,
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              }),

          const Spacer(),

          // logout list tile
          MyDrawerTile(
              text: "Se déconnecter",
              icon: Icons.logout_outlined,
              onTap: () async {
                final authServices = AuthServices();
                await authServices.signOut();

                Provider.of<UserProvider>(context, listen: false).clearUser();
                Navigator.pushReplacementNamed(context, "/login_or_register");
              }),

          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
