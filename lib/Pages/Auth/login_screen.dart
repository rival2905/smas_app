// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smas_app/Pages/Auth/signup_screen.dart';
import 'package:smas_app/Controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Sport News",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black
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
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextField(
                controller: authController.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                     color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(Icons.visibility),
                  )
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Don't have an account yet?",
                    style: TextStyle(fontSize: 11),
                  ),
                // Add spacing between text and button
                  const SizedBox(
                    width: 0,
                  ),
                  TextButton(
                    child: Text("Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationColor: Color(0xffDD9426),
                        color: Color(0xffDD9426)
                      ),
                    ),
                    onPressed: () {
                      // Navigate to sign-up screen
                     Get.to(SignUpScreen());
                      
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    child: Text("Forgot Password?",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationColor: Color(0xffDD9426),
                        color: Color(0xffDD9426)
                      ),
                    ),
                    onPressed: () {
                      // Navigate to sign-up screen
                    },
                  ),
                ]
              ),
              SizedBox(height: 55),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff00A9FA),
                  border: Border.all(color: Color(0xff00A9FA)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Obx(() => ElevatedButton(
                  style: raisedButtonStyle,
                  
                  onPressed: authController.submit,
                  child: authController.isLoading.value ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        )
                  : const Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                  ),
                )),
              )
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
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6))
  ),

);