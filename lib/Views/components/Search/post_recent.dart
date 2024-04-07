import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:smas_app/Controller/post_controller.dart';
import 'package:smas_app/Models/PostModel.dart';
import 'package:smas_app/Views/components/Loading/post_card_hr.dart';
import 'package:smas_app/Views/Post/Widgets/post_card_ver.dart';
import 'package:smas_app/Views/Post/detail_post.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postPageController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        // The search area here
        title: const SearchBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => postPageController.isAllLoading.value
              ? const Column(
                  children: [
                    LoadingPostCardHr(),
                    LoadingPostCardHr(),
                    LoadingPostCardHr(),
                    LoadingPostCardHr(),
                  ],
                )
              : ListView.builder(
                  itemCount: postPageController.allPostsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final PostModel e = postPageController.allPostsList[index];
                    return PostCardVer(
                      ontap: () {
                        Get.to(DetailPostPage(post: e));
                      },
                      imageUrl: e.path!,
                      title: e.title!,
                      author: e.user?.name ?? "Unknown",
                      time: e.createdAt!,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _typeAheadController = TextEditingController();

  PostController postPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<PostModel>(
      builder: (context, controller, focusNode) => TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {
              /* Clear the search field */
              controller.clear();
              postPageController.searchQuery.value = "";
            },
          ),
          hintText: 'Search...',
          border: InputBorder.none,
        ),
      ),
      
      suggestionsCallback: (query) async {
        if (query.isEmpty) {
          return <PostModel>[];
        }
        postPageController.searchPosts(query);
        return postPageController.searchResults.toList();
      },

      itemBuilder: (context, PostModel suggestion) {
        return ListTile(
          title: Text("${suggestion.title}"),
          
        );
      }, 
      onSelected: (value) { 
      postPageController.setToData();
      },
      // onSelected: (PostModel value) { 
      //   Get.to(
      //       DetailPostPage(
      //         post: value,
      //       ),
      //     );
      // },
    );
  }
}