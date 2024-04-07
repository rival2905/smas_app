import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:smas_app/Controller/homepage_controller.dart';
import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Views/components/drawer_screen.dart';

import 'package:smas_app/Models/HomePageModel.dart';
import 'package:smas_app/Models/PostModel.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailPostPage extends StatelessWidget {
  final PostModel post;
  const DetailPostPage({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());

    var data = postController.getDetailPost(post.slug.toString());
    String htmlContent = post.content!;

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
                        // const SizedBox(height: 40),
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
                                  
                                        "https://smas.official.biz.id/storage/"+ post.path!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            post.title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              post.user?.name ?? '',
                              style: const TextStyle(
                                    fontSize: 14,
                              ),
                            ),
                           
                            Text.rich(
                              TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.calendar_month,
                                      size: 14,
                                      color: Color.fromARGB(255, 149, 149, 149),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${post.createdAt!} ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 149, 149, 149),
                                    ),
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.visibility,
                                      size: 14,
                                      color: Color.fromARGB(255, 149, 149, 149),
                                    ),
                                  ),
                                  TextSpan(
                                    text: post.view,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 149, 149, 149),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimaryContainer, // Line color
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // Shadow color
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(1, 5), // Shadow position
                              ),
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
                      right: 0,
                      child: Builder(builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                          ), 
                          child:IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                            onPressed: () => Scaffold.of(context).openEndDrawer(),
                          ),
                        );
                      }),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Builder(builder: (context) {
                        return Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                          ), 
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                            onPressed: () => Get.back(),
                          ),
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