import 'dart:convert' as convert;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/PostModel.dart';
import 'package:smas_app/Models/HomePageModel.dart';

import 'package:http/http.dart' as http;

class PostController extends GetxController{

  RxList<PostPageModel> postData = RxList<PostPageModel>();
  RxList<PostPageModel> postList = RxList<PostPageModel>();
  RxList<HomePageModel> postLista = RxList<HomePageModel>();

  void onInit() async {
    super.onInit();
    getAllPost();
  }
  Future<void> getDetailPost(String slug) async {
    print(slug);
    var response = await http.get(Uri.parse("https://smas.official.biz.id/api/post/show/$slug"), headers: {"Accept": "aplication/json"});

    var post = convert.jsonDecode(response.body)['data'];
    // print(notes);
    postData.clear();
    postData.add(PostPageModel.fromJson(post));

    // print("sampe $postData");

    return post;
  }

  Future<void> getAllPost() async {
    var response = await http.get(
      Uri.parse("https://smas.official.biz.id/api/post/get-all"),
    );
    var notes = convert.jsonDecode(response.body)['data'];
    // print(notes);
    postLista.clear();
    for (var note in notes) {
      postLista.add(HomePageModel.fromJson(note));
    }
    print(postLista);

    print("😍 Note Get ALl");
  }

  

}