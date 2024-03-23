import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/repositories/product_repository.dart';

class HomeController extends GetxController {
  
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);
  PagingController<int, Product> get pagingController => _pagingController;

//  List products = <Product>[].obs;
  late ProductsRepository _productsRepository;
  HomeController() {
    _productsRepository = ProductsRepository();
  }

  @override
  void onInit() {
    _pagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });

    super.onInit();
  }

  getProducts(pageKey) async {
    // products.addAll(await _productsRepository.getProducts());
    var data = await _productsRepository.getProducts(pageKey);
    if (data.length == 0) {
      _pagingController.appendLastPage(data);
    } else {
      _pagingController.appendPage(data, pageKey + 1);
    }

    print("Page $pageKey");
  }
}
