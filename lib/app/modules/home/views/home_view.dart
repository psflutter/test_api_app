import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_api_app/app/modules/home/controllers/home_controller.dart';
import 'package:test_api_app/app/modules/home/product_model.dart';
import 'package:test_api_app/app/modules/widgets/product_item_widget.dart';

class HomeView extends GetView<HomeController> {
  final bool datais = false;
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ///CAROUSELSLIDER
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    controller.onPageChanged(index);
                  },
                ),
                items: controller.imgList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.imgList.length,
                    (index) => Obx(
                      () => Container(
                        width: controller.currentIndex.value == index ? 10 : 8,
                        height: controller.currentIndex.value == index ? 10 : 8,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: controller.currentIndex.value == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),

          ///CATAGORES
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Catagores",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 90,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: 200,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${controller.categories[index].aPI}"),
                                Text(
                                  "${controller.categories[index].description}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("${controller.categories[index].auth}"),
                                Text(
                                  "${controller.categories[index].link}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          ///PRODUCT

          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Product",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
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
