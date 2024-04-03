import 'package:get/get.dart';
import 'package:test_api_app/app/model/product_model.dart';

class ProductController extends GetxController {
  Product product = Get.arguments["productItem"];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
