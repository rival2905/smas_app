import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smas_app/Pages/HomePage/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';



class BottomTabNavigator extends StatelessWidget {
  const BottomTabNavigator({super.key});


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: 0),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    
        return [
          HomePage(),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold
            ),
          )
        ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.news),
                title: ("News"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle),
                title: ("Account"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
}
