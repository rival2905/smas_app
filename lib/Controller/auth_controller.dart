import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../service/api/auth_provider.dart';
import 'package:smas_app/Models/AuthModel.dart';
import 'package:smas_app/Views/Auth/login_screen.dart';
import 'package:smas_app/Views/components/tab_navigator.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:smas_app/Models/UserModel.dart';
class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordconfirmController = TextEditingController();
  RxList<UserModel> myDetailUser = RxList<UserModel>();
  RxBool isUser = false.obs;

  var buttonEnabled = false.obs;
  var isLoading = false.obs;
  var isShowPassword = false.obs;
  var isShowPasswordConfirm = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  final box = GetStorage();


final user = Rx<UserModel?>(null);

void onInit() async {
  super.onInit();
  myUser();
  final userData = await myUser();
  if (userData != null) {
    user.value = UserModel.fromJson(userData);
  }
}

  void submit() async {
    if (emailController.text == '') {
      emailError.value = 'Email is required';
    }
    if (passwordController.text == '') {
      passwordError.value = 'Password is required';
    }
    if (emailController.text != '' && passwordController.text != '') {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      await AuthService.login(emailController.text, passwordController.text)
          .then((value) {
        // print(value);
        isLoading.value = false;
        if (value == 'success') {
          myUser();
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
  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('https://smas.official.biz.id/api/logout'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode == 201) {
      box.remove('accestoken'); // reset token
      
    } else {
      throw Exception('Failedto logout');
    }
  }
  Future<dynamic> myUser() async {
    final token = await box.read("accestoken");
    var baseURL = "https://smas.official.biz.id/api/my-user";

    try {
      final response = await http.get(Uri.parse(baseURL), headers: {
          'Authorization': 'Bearer $token',
        }).timeout(const Duration(seconds: 10), onTimeout: () {
          return http.Response('timeout', 408);
        });
  
      if (response.statusCode == 201 || response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var user = body["data"];
        myDetailUser.clear();
        myDetailUser.add(UserModel.fromJson(user));
        isUser.value = true;

        return user;
        
      } else {
        throw Exception('User Not found');
      }
    } catch (x) {
      print(x);

    }
  }
  Future<void> register() async {
  var newUser = {
    "name": nameController.text,
    "email": emailController.text,
    "password": passwordController.text,
    "password_confirmation": passwordconfirmController.text, // corrected the variable name
  };

  if (nameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      passwordconfirmController.text.isNotEmpty) {
    var response = await http.post(
      Uri.parse("https://smas.official.biz.id/api/user/register"),
      body: json.encode(newUser), // encoded the newUser as JSON
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode == 201) {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      passwordconfirmController.clear();
      print("❤️ User Added");
    }
  } else {
    print("❌ Form must be completed");
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
              isUser.value = false;
              box.remove('accestoken'); // reset token
              Get.back();
              Get.offAll(const LoginScreen());
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

