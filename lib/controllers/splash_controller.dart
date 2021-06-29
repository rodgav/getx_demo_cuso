import 'package:get/get.dart';
import 'package:getx_demo/pages/home_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(HomePage(),transition: Transition.zoom);
    });
    super.onReady();
  }
}
