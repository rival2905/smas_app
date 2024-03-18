import 'dart:convert' as convert;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/PostModel.dart';
import 'package:smas_app/Models/HomePageModel.dart';

import 'package:http/http.dart' as http;

class PostController extends GetxController{

  RxList<HomePageModel> postData = RxList<HomePageModel>();

  Future<void> getDetailPost(String slug) async {
    print(slug);
    var response = await http.get(Uri.parse("https://smas.official.biz.id/api/post/show/$slug"), headers: {"Accept": "aplication/json"});

    var post = convert.jsonDecode(response.body)['data'];
    // print(notes);
    postData.clear();
    postData.add(HomePageModel.fromJson(post));

    print("sampe $postData");

    return post;
  }

  

}