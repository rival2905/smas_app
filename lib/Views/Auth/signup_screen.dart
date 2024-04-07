// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smas_app/Controller/auth_controller.dart';
import 'package:textrich/textrich.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo_no_text.png",
                height: 157,
                width: 202,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sport Management System",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextField(
                controller: authController.nameController,

                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                     color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                  fillColor: Theme.of(context).colorScheme.primaryContainer,

                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextField(
                controller: authController.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                     color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                  fillColor: Theme.of(context).colorScheme.primaryContainer,

                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Obx(() => TextField(
                controller: authController.passwordController,

                textInputAction: TextInputAction.next,

                obscureText: !authController.isShowPassword.value,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                    color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                  fillColor: Theme.of(context).colorScheme.primaryContainer,

                  suffixIcon: IconButton(
                    onPressed: () {
                      authController.isShowPassword.value = !authController.isShowPassword.value;
                    },
                    icon: Icon(
                      authController.isShowPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                    ),
                  )
                ),
              )),
              const SizedBox(
                height: 17,
              ),
              Obx(() => TextField(
                controller: authController.passwordconfirmController,
                obscureText: !authController.isShowPassword.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password Confirmation',
                  fillColor: Theme.of(context).colorScheme.primaryContainer,

                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     authController.isShowPasswordConfirm.value = !authController.isShowPasswordConfirm.value;
                  //   },
                  //   icon: Icon(
                  //     authController.isShowPasswordConfirm.value
                  //       ? Icons.visibility
                  //       : Icons.visibility_off,
                  //   ),
                  // )
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRich(
                    "Have account already? Please go to Sign In",
                    matchTexts: const ["Please go to Sign In"],
                    matchStyles: const [TextStyle(color: Color(0xffDD9426),fontStyle: FontStyle.italic,fontSize: 11,decoration: TextDecoration.underline, decorationColor: Color(0xffDD9426),)],
                    onTap: (value){
                      Get.back();
                    },
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  
                ]
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff00A9FA),
                  border: Border.all(color: const Color(0xff00A9FA)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                  ),
                  onPressed: () {
                    authController.register();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

final ButtonStyle raisedButtonStyle= ElevatedButton.styleFrom(
  foregroundColor: const Color(0xff00A9FA), 
  backgroundColor: const Color(0xff00A9FA),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6))
  ),

);