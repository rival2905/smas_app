import 'package:flutter/material.dart';
import 'package:smas_app/Controller/splace_controller.dart';
import 'package:get/get.dart';

class SplaceScreenPageState extends StatelessWidget {
  const SplaceScreenPageState({super.key});

  @override
  Widget build(BuildContext context){
    Get.put(SplaceController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Logo_no_text.png",
            height: 387,
            width: 500,),
          Text(
            "Final Project",
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      )
    );
  }
}