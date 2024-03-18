import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:smas_app/Controller/homepage_controller.dart';
import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Pages/components/drawer_screen.dart';

import 'package:smas_app/Models/HomePageModel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailPostPage extends StatelessWidget {
  final HomePageModel post;
  const DetailPostPage({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    PostController postController = Get.put(PostController());

    var data = postController.getDetailPost(post.slug.toString());
    String htmlContent = post.content!;

    print(post.title!);
    return Scaffold(
      endDrawer: const DrawerScreen(),

      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 40),

                        Center(
                          child: Text(
                            post.title!,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              post.user?.name ?? '',
                              style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                              ),
                            ),
                            Text(
                              "${post.createdAt}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 149, 149, 149),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                            color: Colors.black, // Line color
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // Shadow color
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(1, 5), // Shadow position
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              post.title!,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          // height: 330,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                  
                                        "https://static.toiimg.com/thumb/msid-46918916,width=1200,height=900/46918916.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Flexible(
                              child: HtmlWidget(
                                post.content ?? "No Description",
                              
                              ),

                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu,
                              color: Color.fromARGB(255, 0, 0, 0), size: 30),
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                        );
                      }),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 0, 0, 0), size: 30),
                          onPressed: () => Get.back(),
                        );
                      }),
                    ),

                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}