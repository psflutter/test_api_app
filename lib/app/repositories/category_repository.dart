import 'package:get/get.dart';
import 'package:test_api_app/app/modules/home/category_model.dart';
import 'package:test_api_app/app/service/api_service.dart';

class CategoryRepository {
  var baseUrl = 'https://api.publicapis.org/';
  final ApiService _apiService = Get.find();

  Future<List<Categores>> getCategories() async {
    List<Categores> categories = [];

    final data = await _apiService.get("${baseUrl}entries");
    var datac = data["entries"];
    print("data ==> ${data["entries"]}");

    // for (var element in data) {
    //   categories.add(Product.fromJson(element));
    // }

    datac
        .map((element) => categories.add(Categores.fromJson(element)))
        .toList();

    return categories;
  }
}
