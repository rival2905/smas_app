import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../service/api/auth_provider.dart';
import 'package:smas_app/Models/AuthModel.dart';
import 'package:smas_app/Pages/HomePage/home_page.dart';
import 'package:smas_app/Pages/Auth/login_screen.dart';
import 'package:smas_app/Pages/components/tab_navigator.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var buttonEnabled = false.obs;
  var isLoading = false.obs;
  var isShowPassword = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;

  void submit() async {
    if (emailController.text == '') {
      emailError.value = 'Email is required';
    }
    if (passwordController.text == '') {
      passwordError.value = 'Password is required';
    }
    if (emailController.text != '' && passwordController.text != '') {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      await AuthService.login(emailController.text, passwordController.text)
          .then((value) {
        print(value);
        isLoading.value = false;
        if (value == 'success') {
          Get.offAll(const BottomTabNavigator());
        }else {
          modalFailedLogin(value);
        }

        if (value == 'error') {
          Get.snackbar(
            'Error',
            'Email or password is wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      });
    }
  }

  void modalLogout() {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xff292C2A),
        title: const Text('Logout', style: TextStyle(color: Colors.red)),
        content: const Text('Apakah anda yakin ingin logout?',
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff292C2A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.red),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              Get.back();
              Get.offAll(LoginScreen());
            },
            child: const Text('Ya', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void modalFailedLogin(String value) {
    Get.dialog(
      AlertDialog(
        title: Text('Something when wrong!'),
        content: Text("Email or Password did't match!!"),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () async {
              Get.back();
              Get.offAll(const LoginScreen());
            },
          ),
        ],
      )
    );
  }

}