import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_api_app/app/model/category_model.dart';
import 'package:test_api_app/app/model/product_model.dart';
import 'package:test_api_app/app/repositories/category_repository.dart';
import 'package:test_api_app/app/repositories/product_repository.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  RxBool isLoading = true.obs;
  List<Categores> categories = <Categores>[].obs;
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);
  PagingController<int, Product> get pagingController => _pagingController;

//  List products = <Product>[].obs;
  late ProductsRepository _productsRepository;
  late CategoryRepository _categoryRepository;
  HomeController() {
    _productsRepository = ProductsRepository();
    _categoryRepository = CategoryRepository();
  }

  @override
  void onInit() {
    getCategories();
    _pagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });

    super.onInit();
  }

  getProducts(pageKey) async {
    // products.addAll(await _productsRepository.getProducts());
    var data = await _productsRepository.getProducts(pageKey);
    if (data.isEmpty) {
      _pagingController.appendLastPage(data);
    } else {
      _pagingController.appendPage(data, pageKey + 1);
    }
  }

  getCategories() async {
    categories.addAll(await _categoryRepository.getCategories());
    isLoading.value = false;
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
