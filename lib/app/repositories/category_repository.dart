import 'package:get/get.dart';
import 'package:test_api_app/app/model/category_model.dart';
import 'package:test_api_app/app/service/api_service.dart';

class CategoryRepository {
  var baseUrl = 'https://api.publicapis.org/';
  final ApiService _apiService = Get.find();

  Future<List<Categores>> getCategories() async {
    List<Categores> categories = [];

    final data = await _apiService.get("${baseUrl}entries");
    List datac = data["entries"];
    print("data ==> ${data["entries"]}");

    for (int i = 0; i < datac.length; i++) {
      if (i == 5) {
        break;
      }
      categories.add(Categores.fromJson(datac[i]));
    }

    // for (var element in datac) {
    //   categories.add(Categores.fromJson(element));
    // }

    // datac.forEach((element) {
    //   categories.add(Categores.fromJson(element));
    // });

    // datac
    //     .map((element) => categories.add(Categores.fromJson(element)))
    //     .toList();

    return categories;
  }
}
