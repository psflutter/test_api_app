import 'package:get/get.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/service/api_service.dart';

class ProductsRepository {
  var baseUrl = 'https://reqres.in/api/';
  final ApiService _apiService = Get.find();

  Future<List<Product>> getProducts(pageKey) async {
    List<Product> products = [];

    final data = await _apiService.get("${baseUrl}users?page=$pageKey");
    var dataa = data["data"];

    // for (var element in data) {
    //   products.add(Product.fromJson(element));
    // }

    dataa.map((element) => products.add(Product.fromJson(element))).toList();

    return products;
  }

  Future<List<Product>> getCategories(pageKey) async {
    List<Product> categories = [];

    final data = await _apiService.get("${baseUrl}users?page=$pageKey");

    for (var element in data) {
      categories.add(Product.fromJson(element));
    }

    // data.map((element) => categories.add(Category.fromJson(element))).toList();

    return categories;
  }
}
