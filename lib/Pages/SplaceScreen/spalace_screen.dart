import 'package:flutter/material.dart';
import 'package:smas_app/Controller/splace_controller.dart';
import 'package:get/get.dart';

class SplaceScreenPageState extends StatelessWidget {
  const SplaceScreenPageState({super.key});

  @override
  Widget build(BuildContext context){
    Get.put(SplaceController());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 245, 248, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Logo_no_text.png",
            height: 387,
            width: 500,),
          const Text(
            "Final Project",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
              color: Colors.black
            ),
          )
        ],
      )
    );
  }
}