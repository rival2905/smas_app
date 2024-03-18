import 'package:get/get.dart';
import 'package:smas_app/Pages/Auth/login_screen.dart';
import 'package:smas_app/Pages/components/tab_navigator.dart';

class SplaceController extends GetxController{
  @override 
  void onReady(){
    super.onReady();
    splaceScreen();
  }

  void splaceScreen(){
    Future.delayed(const Duration(seconds: 1),(){
      Get.offAll(const LoginScreen());
    });
  }
}