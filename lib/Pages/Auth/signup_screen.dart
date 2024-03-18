// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
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
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextField(
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
                textInputAction: TextInputAction.next,

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
                    icon: const Icon(Icons.visibility),
                  )
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff9E9E9E)
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password Confirmation',
                  suffixIcon: IconButton(
                    onPressed: () {
                          
                    },
                    icon: const Icon(Icons.visibility),
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
                    "Have account already? Please go to",
                    style: TextStyle(fontSize: 11),
                  ),
                // Add spacing between text and button
                  const SizedBox(
                    width: 0,
                  ),
                  TextButton(
                    child: Text("Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationColor: const Color(0xffDD9426),
                        color: const Color(0xffDD9426)
                      ),
                    ),
                    onPressed: () {
                      // Navigate to sign-up screen
                      Get.back();
                    },
                  )
                ]
              ),
              const SizedBox(height: 0),
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