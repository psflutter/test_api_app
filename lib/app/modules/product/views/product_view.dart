import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_app/app/modules/product/controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("product"),
          centerTitle: true,
        ),
        body: Stack(children: [
          Hero(
            tag: "${controller.product.id}",
            child: Image.network(
              "${controller.product.avatar}",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 20,
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Chip(
                    label: Text(
                      "${controller.product.id}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 40,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Chip(
                  label: Row(
                    children: [
                      Text(
                        "Name :- ${controller.product.firstName}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${controller.product.lastName}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Chip(
                  label: Text(
                    "Email :- ${controller.product.email}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
