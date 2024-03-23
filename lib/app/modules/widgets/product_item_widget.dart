import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_app/app/modules/home/controllers/home_controller.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/routes/app_pages.dart';

class ProductItemWidget extends GetWidget<HomeController> {
  final Product productItem;
  const ProductItemWidget({
    super.key,
    required this.productItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(Routes.PRODUCT, arguments: {"productItem": productItem}),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              "${productItem.avatar}",
              height: 30,
              width: 30,
            )),
        title: Row(
          children: [
            Text("${productItem.firstName}"),
            const SizedBox(
              width: 6,
            ),
            Text("${productItem.lastName}"),
          ],
        ),
        subtitle: Text("${productItem.email}"),
      ),
    );
  }
}
