import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  Future<ApiService> init() async {
    return this;
  }

  Future<dynamic> get(String data) async {
    List datas = [];
    var response = await http.get(Uri.parse("$data"));
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body) as Map<String, dynamic>;
      datas = user["data"] as List;
    }

    return datas;
  }

  postApi(String podtUrl, Map requestBody) async {
    var response = await http.post(Uri.parse("$podtUrl"), body: requestBody);
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body) as Map<String, dynamic>;
      print("response  ${response.body}");
      return user;
    } else {
      Get.snackbar("", "Something went wrong.");
    }
  }
}
