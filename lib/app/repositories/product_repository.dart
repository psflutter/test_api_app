import 'package:get/get.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/service/api_service.dart';

class ProductsRepository {
  var baseUrl = 'https://reqres.in/api/';
  final ApiService _apiService = Get.find();

  Future<List<Product>> getProducts(pageKey) async {
    List<Product> products = [];

    final data = await _apiService.get("${baseUrl}users?page=$pageKey");

    // for (var element in data) {
    //   products.add(Product.fromJson(element));
    // }

    data.map((element) => products.add(Product.fromJson(element))).toList();

    return products;
  }
}
