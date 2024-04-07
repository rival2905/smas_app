import 'package:flutter/material.dart';
import 'package:smas_app/Controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:smas_app/Views/Auth/login_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context){
    AuthController authController = Get.put(AuthController());
    String nameUser = authController.user.value?.name ?? "Guest";
    String emailUser = authController.user.value?.email ?? "";
    if(authController.isUser.value){
      print(authController.isUser.value);

    }
    return Drawer(
      child: ListView(
        children: [
           UserAccountsDrawerHeader(
            accountName: Text(nameUser,
            textAlign:TextAlign.center),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
            ),
            accountEmail: Text(emailUser),
          ),
          if (authController.isUser.value)
            Column(
              children: [
                DrawerListTile(
                  iconData: Icons.group,
                  title: "New Group",
                  onTilePressed: () {},
                ),
                DrawerListTile(
                  iconData: Icons.lock,
                  title: "New Secret Group",
                  onTilePressed: () {},
                ),
                DrawerListTile(
                  iconData: Icons.notifications,
                  title: "New Channel Chat",
                  onTilePressed: () {},
                ),
                DrawerListTile(
                  iconData: Icons.contacts,
                  title: "Contacts",
                  onTilePressed: () {},
                ),
                DrawerListTile(
                  iconData: Icons.bookmark_border,
                  title: "Saved Message",
                  onTilePressed: () {},
                ),
                DrawerListTile(
                  iconData: Icons.phone,
                  title: "Calls",
                  onTilePressed: () {
                    print("Rivaldo");
                  },
                ),
                DrawerListTile(
                  iconData: Icons.logout,
                  title: "Logout",
                  onTilePressed: () {
                    authController.modalLogout();
                  },
                ),
              ],
            )
          else
            DrawerListTile(
              iconData: Icons.logout,
              title: "Login",
              onTilePressed: () {
                Get.offAll(const LoginScreen());
              },
            )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;
  DrawerListTile({
    Key? key,
    required this.iconData,
    this.onTilePressed,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}