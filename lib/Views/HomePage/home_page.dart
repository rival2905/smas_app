
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Controller/auth_controller.dart';

import 'package:smas_app/Views/HomePage/recent_post_widgets.dart';

import 'package:smas_app/Views/components/drawer_screen.dart';
import 'package:smas_app/Views/components/Loading/post_homepage.dart';
import 'package:smas_app/Views/components/Search/post_recent.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    PostController postController = Get.put(PostController());
    AuthController authController = Get.put(AuthController());

    return Obx(() {
      String nameUser = authController.user.value?.name ?? "Hii, ";
    
      return SafeArea(
        child: Scaffold(
          
          endDrawer: const DrawerScreen(),
          body: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/wraper.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              "Recent News",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            TextButton(
                              child: Text("See all",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  decorationColor: const Color(0xffDD9426),
                                  color: const Color(0xffDD9426)
                                ),
                              ),
                             
                              onPressed: () => Navigator.of(context).push(_createRoute()),
                             
                            ),
                          ],
                        ),
                      ),     
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.3,
                        child:  Obx(
                          () => postController.isRecentLoading.value
                          ? GridView.count(
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              crossAxisCount: 2,
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              children: const [
                                LoadingPostHomePage(),
                                LoadingPostHomePage(),
                                LoadingPostHomePage(),
                                LoadingPostHomePage()
                              ],
                            )
                          : GridView.count(
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            children: postController.recentPostsList
                            .map(
                              (e) => RecentPostWidgets(
                                post: e,
                              ),
                            ).toList(),
                          )
                        )
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Builder(builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.white, size: 30),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                      );
                    }),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Text(
                            nameUser,
                            style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          
                        ],
                      );
                      
                    }),
                  ),
                  Positioned(
                    top: 45,
                    left: 10,
                    child: Builder(builder: (context) {
                      return const Column(
                        children: [
                          Text(
                            'Join us to stay fit now via the mobile app',
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                        ],
                      );
                      
                    }),
                  ),
                  Positioned(
                    top: 140,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xffDD9426),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/lokasi.png')),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Location:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Jl. Raya Cibeureum No.52, Campaka, Kec. Andir,\nKota Bandung, Jawa Barat 40535',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
    );
  }

  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 2.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


  
}