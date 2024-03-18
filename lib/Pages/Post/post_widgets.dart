import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smas_app/Models/HomePageModel.dart';
import 'package:smas_app/Pages/Post/detail_post.dart';


class PostWidgets extends StatelessWidget {
  final HomePageModel post;
  const PostWidgets({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final moonLanding = DateTime.parse(post.createdAt!);
    final day = moonLanding.day;
    final month = moonLanding.month;
    final year = moonLanding.year;
    return InkWell(
      onTap: () {
        Get.to(DetailPostPage(
          post: post,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Logo_no_text.png'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Ubah warna gradient di sini
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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "$day/$month/$year",
                      style: TextStyle(
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
