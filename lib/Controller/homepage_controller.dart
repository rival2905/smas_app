import 'dart:convert' as convert;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/PostModel.dart';
import 'package:smas_app/Models/HomePageModel.dart';

import 'package:http/http.dart' as http;

class HomePageController extends GetxController{
  String url_post_homepage = "https://smas.official.biz.id/api/post/get-recent";
  String url = "https://657d4932853beeefdb9a7f7f.mockapi.io/note";
  RxList<HomePageModel> noteList = RxList<HomePageModel>();
  RxList<HomePageModel> postListHomePage = RxList<HomePageModel>();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController titleDetails = TextEditingController();
  TextEditingController contDetails = TextEditingController();
  
  void onInit() async {
    super.onInit();
    getPostHome();
  }

  Future<void> getPostHome() async {
    var response = await http.get(
      Uri.parse(url_post_homepage),
    );
    var notes = convert.jsonDecode(response.body)['data'];
    // print(notes);
    postListHomePage.clear();
    for (var note in notes) {
      postListHomePage.add(HomePageModel.fromJson(note));
    }
    // print(postListHomePage);
    print(postListHomePage);

    print("😍 Note Get");
  }

  

}