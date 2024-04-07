import 'dart:convert' as convert;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/PostModel.dart';


import 'package:http/http.dart' as http;

class PostController extends GetxController{

  RxList<PostModel> postData = RxList<PostModel>();
  RxList<PostModel> postList = RxList<PostModel>();
  RxList<PostModel> postLista = RxList<PostModel>();
  RxList<PostModel> allPostsList = <PostModel>[].obs;
  RxList<PostModel> recentPostsList = <PostModel>[].obs;
  RxList<PostModel> favoritePostsList = <PostModel>[].obs;
  RxList<PostModel> defaultPostList = <PostModel>[].obs;

  RxBool isAllLoading = false.obs;
  RxBool isRecentLoading = false.obs;
  RxBool isFavoriteLoading = false.obs;

  RxString searchQuery = "".obs;
  RxList<PostModel> searchResults = <PostModel>[].obs;

  void onInit() async {
    super.onInit();
    getAll();
    getRecent();
    getFavorie();

    ever(searchQuery, (_) {
      if (searchQuery.value.isEmpty) {
        searchResults.clear();
        allPostsList.assignAll(defaultPostList);
        return;
      }
      searchResults.assignAll(allPostsList.where((post) => post.title!.toLowerCase().contains(searchQuery.value.toLowerCase())).toList());
      // allPostsList.assignAll(allPostsList.where((post) => post.title!.toLowerCase().contains(searchQuery.value.toLowerCase())).toList());
      // searchResults.assignAll(allPostsList);
    });
    
  }
  Future<void> searchPosts(String query) async {
    searchQuery.value = query;
    print(searchQuery.value);
  }
  Future<void> setToData() async {
    allPostsList.assignAll(searchResults);
  }
  
  Future<void> getDetailPost(String slug) async {
      var baseURL = "https://smas.official.biz.id/api/post/show/$slug";
    try {
      var response = await http.get(Uri.parse(baseURL), headers: {"Accept": "aplication/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var post = convert.jsonDecode(response.body)['data'];
        // print(notes);
        postData.clear();
        postData.add(PostModel.fromJson(post));

        // print("sampe $postData");
        return post;
      }else {
        throw Exception();
      }
      
    } catch (ex) {
      print(ex);

    }
  }

  Future<void> getAll() async {
    isAllLoading.value = true;
    var baseURL =
        "https://smas.official.biz.id/api/post/get-all";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200 || response.statusCode == 201) {
  
        var body = convert.jsonDecode(response.body);
        var articals = body["data"];
        for (var post in articals) {
          allPostsList.add(PostModel.fromJson(post));
          defaultPostList.add(PostModel.fromJson(post));

        }
      } else {
        print("Something went Wrong in Recent Post");
      }
    } catch (ex) {
      print(ex);

    }
    isAllLoading.value = false;
  }

  Future<void> getRecent() async {
    isRecentLoading.value = true;
    var baseURL =
        "https://smas.official.biz.id/api/post/get-recent";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
  
        var body = convert.jsonDecode(response.body);
        var articals = body["data"];
        for (var post in articals) {
          recentPostsList.add(PostModel.fromJson(post));
        }
      } else {
        print("Something went Wrong in Recent Post");
      }
    } catch (ex) {
      print(ex);

    }
    isRecentLoading.value = false;
  }

  Future<void> getFavorie() async {
    isFavoriteLoading.value = true;
    var baseURL =
        "https://smas.official.biz.id/api/post/get-favorite";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var body = convert.jsonDecode(response.body);
        var articals = body["data"];
        for (var post in articals) {
          favoritePostsList.add(PostModel.fromJson(post));
        }
      } else {
        print("Something went Wrong in Recent Post");
      }
    } catch (ex) {
      print(ex);
    }
    isFavoriteLoading.value = false;
  }

}