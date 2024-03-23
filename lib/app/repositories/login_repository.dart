import 'package:get/get.dart';
import 'package:test_api_app/app/service/api_service.dart';
import 'package:test_api_app/app/service/storage_service.dart';

class LoginRepository {
  final ApiService _apiService = Get.find();
  final StorageService _storageService = Get.find();

  postApi(requestBody) async {
    var token =
        await _apiService.postApi('https://reqres.in/api/login', requestBody);
    _storageService.write("token", token["token"]);
    return token["token"];
  }
}
