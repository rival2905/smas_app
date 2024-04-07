import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/HomePageModel.dart';
import 'package:smas_app/Models/PostModel.dart';

import 'package:smas_app/Views/Post/detail_post.dart';


class RecentPostWidgets extends StatelessWidget {
  final PostModel post;
  const RecentPostWidgets({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final moonLanding = post.createdAt!;

    return InkWell(
      onTap: () {
        Get.to(DetailPostPage(
          post: post,
        ));
      },
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://smas.official.biz.id/storage/"+ post.path!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.hardLight,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title!,
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      moonLanding,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
