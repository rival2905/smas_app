import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smas_app/Models/HomePageModel.dart';
import 'package:smas_app/Models/PostModel.dart';
import 'package:smas_app/Views/Post/detail_post.dart';
import 'package:smas_app/Helper/calendar.dart';

class PostWidgets extends StatelessWidget {
  final PostModel post;
  const PostWidgets({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: () {
        Get.to(DetailPostPage(
          post: post,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                "https://smas.official.biz.id/storage/"+ post.path!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10), // tambahkan jarak antara image dan text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title!,
                    maxLines: 2, // Ubah nilai ini sesuai kebutuhan
                    softWrap: true,
                  ),
                  Text(
                    post.createdAt!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}