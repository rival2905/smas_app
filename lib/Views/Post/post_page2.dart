import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Views/Post/Widgets/post_card_hr.dart';
import 'package:smas_app/Views/Post/Widgets/post_card_ver.dart';

import 'package:smas_app/Views/Post/detail_post.dart';
import 'package:smas_app/Views/components/drawer_screen.dart';
import 'package:smas_app/Views/components/Loading/post_card_ver.dart';
import 'package:smas_app/Views/components/Loading/post_card_hr.dart';

import 'package:smas_app/Views/components/Search/post_recent.dart';

class PostPage2 extends StatelessWidget {
  const PostPage2({super.key});

  @override
  Widget build(BuildContext context) {
    PostController postPageController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/Logo_no_text.png',),
        title: Text("Our News"),
        // scrolledUnderElevation: scrolledUnderElevation,
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).shadowColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
              postPageController.searchQuery.value = "";
            }, 
            icon: const Icon(Icons.search)
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // Text(
                  //   "See All",
                  //   style: Theme.of(context).textTheme.labelSmall,
                  // )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Obx(
                  () => postPageController.isFavoriteLoading.value
                    ? const Row(
                        children: [
                          LoadingPostCardVer(),
                          LoadingPostCardVer(),
                        ],
                      )
                    : Row(
                        children: postPageController.favoritePostsList
                          .map(
                            (e) => PostCardHr(
                              ontap: () {
                                Get.to(DetailPostPage(
                                  post: e,
                                ));
                              },
                              imageUrl: e.path!,
                              title: e.title!,
                              author: e.user?.name ?? "Unknown",
                              view: e.view!,
                              time: e.createdAt!,
                            ),
                          )
                        .toList(),
                      )
                ),
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For you",
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
                   
                    onPressed: () {
                      postPageController.searchQuery.value = "";
                      Navigator.of(context).push(_createRoute());
                    } 
                      
                   
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => postPageController.isRecentLoading.value
                ? const Column(
                    children: [
                      LoadingPostCardHr(),
                      LoadingPostCardHr(),
                      LoadingPostCardHr(),
                      LoadingPostCardHr(),
                    ],
                  )
                : Column(
                children: postPageController.recentPostsList
                  .map(
                    (e) => PostCardVer(
                      ontap: () {
                        Get.to(DetailPostPage(
                          post: e,
                        ));
                      },
                      imageUrl: e.path!,
                      title: e.title!,
                      author: e.user?.name ?? "Unknown",
                      time: e.createdAt!,
                    ),
                  )
                    .toList(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SearchPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
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
