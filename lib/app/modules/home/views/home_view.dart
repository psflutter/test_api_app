import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_api_app/app/modules/home/controllers/home_controller.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/modules/widgets/product_item_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Product"),
          Expanded(
            child: PagedListView<int, Product>(
              // itemCount: controller.products.length,
              // itemBuilder: (context, index) => ProductItemWidget(
              //       productItem: controller.products[index],
              //     ),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Product>(
                  itemBuilder: (context, item, index) {
                return ProductItemWidget(
                  productItem: item,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
