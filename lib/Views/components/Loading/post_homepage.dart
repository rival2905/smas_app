import 'package:flutter/material.dart';

import 'loading_container.dart';

import 'package:get/get.dart';
import 'package:smas_app/Models/PostModel.dart';

import 'package:smas_app/Views/Post/detail_post.dart';

class LoadingPostHomePage extends StatelessWidget {
  const LoadingPostHomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,

        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingContainer(
                    width: MediaQuery.of(context).size.width / 1.6,
                    hight: 30,
                  ),
                  const SizedBox(height: 5),
                  LoadingContainer(
                    width: MediaQuery.of(context).size.width / 1.6,
                    hight: 30,
                  ),
                  const SizedBox(height: 10),
                  LoadingContainer(
                    width: MediaQuery.of(context).size.width / 5,
                    hight: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
