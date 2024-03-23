import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_api_app/app/routes/app_pages.dart';
import 'package:test_api_app/app/service/storage_service.dart';

class TokanMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final StorageService _storageService = Get.find();

    if (_storageService.read("token") == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
