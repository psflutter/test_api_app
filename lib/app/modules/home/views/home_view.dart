import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_api_app/app/modules/home/controllers/home_controller.dart';
import 'package:test_api_app/app/model/product_model.dart';
import 'package:test_api_app/app/modules/home/widgets/category_item_widget.dart';
import 'package:test_api_app/app/modules/widgets/product_item_widget.dart';
import 'package:test_api_app/widgets/app_text_widget.dart';

class HomeView extends GetView<HomeController> {
  final bool datais = false;
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return ListView.separated(
            itemCount: controller.categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.40,
                    child: const Row(
                      children: [
                        Text("data: "),
                        Text(
                          "controller.categories[index].aPI",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                    child: VerticalDivider(endIndent: 0),
                  ),
                  const Text(
                    "controller.categories[index].aPI",
                    textAlign: TextAlign.left,
                  ),
                ],
              );
            },
          );

          // SingleChildScrollView(
          //     child: Wrap(
          //   children: [
          //     for (int i = 0; i < controller.categories.length; i++)
          //       Container(
          //           height: 30,
          //           width: 80,
          //           child: Text("${i + 1} ${controller.categories[i].aPI}  "))
          //   ],
          // ));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                ///CAROUSELSLIDER
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          controller.onPageChanged(index);
                        },
                      ),
                      items: controller.imgList.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.dstATop,
                                  color: const Color(0xFFEEEEEE),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.imgList.length,
                              (index) => Obx(
                                () => Container(
                                  width: controller.currentIndex.value == index
                                      ? 10
                                      : 8,
                                  height: controller.currentIndex.value == index
                                      ? 10
                                      : 8,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color:
                                        controller.currentIndex.value == index
                                            ? Colors.blue
                                            : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                ///CATAGORES
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    AppTextWidgets(
                      text: 'Catagores',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 110,
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) => CatagoreItemWidget(
                              item: controller.categories[index],
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                ///PRODUCT

                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    AppTextWidgets(
                      text: 'Product',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 1200,
                  child: PagedListView<int, Product>(
                    physics: const NeverScrollableScrollPhysics(),
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
      }),
    );
  }
}
