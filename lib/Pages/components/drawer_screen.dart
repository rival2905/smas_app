import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Rivaldo"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
            ),
            accountEmail: Text("mr1rivaldo@gmail.com"),
          ),
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

            },
          ),
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