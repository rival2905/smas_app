// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:smas_app/Pages/components/drawer_screen.dart';
import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Pages/Post/post_widgets.dart';


class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context){
    PostController postPageController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        // scrolledUnderElevation: scrolledUnderElevation,
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).shadowColor
      ),
      endDrawer: const DrawerScreen(),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238), // Line color
              
            ),
            child: const TextField(
              
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Cari Berita',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                      height: MediaQuery.of(context).size.height,
                      child:  Obx(() => GridView.count(
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        crossAxisCount: 3,
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 0),
                        children: postPageController.postLista
                        .map(
                          (e) => PostWidgets(
                            post: e,
                          ),
                        ).toList(),
                      ))
                    );
              },
            ),
          )
        ],
      ),
    );
  }

}
