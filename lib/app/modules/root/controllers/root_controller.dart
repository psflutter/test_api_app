/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../home/views/home2_view.dart';
import '../../messages/controllers/messages_controller.dart';
import '../../messages/views/messages_view.dart';

class RootController extends GetxController {
  final eServices = <CartViewModel>[].obs;
  late CarttRepository _carttRepository;
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;
  final cartCount = 0.obs;
  final customPages = <CustomPage>[].obs;
  late NotificationRepository _notificationRepository;
  late CustomPageRepository _customPageRepository;

  RootController() {
    _notificationRepository = new NotificationRepository();
    _customPageRepository = new CustomPageRepository();
    _carttRepository = new CarttRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    await getCustomPages();
    await viewCart();
  }

  List<Widget> pages = [
    Home2View(),
    BookingsView(),
    MessagesView(),
    AccountView(),
  ];
 
  Widget get currentPage => pages[currentIndex.value];

  /**
   * change page in route
   * */
  Future<void> changePageInRoot(int _index) async {
    if (!Get.find<AuthService>().isAuth && _index > 0) {
      await Get.toNamed(Routes.LOGIN);
    } else {
      currentIndex.value = _index;
      await refreshPage(_index);
    }
  }

  Future<void> changePageOutRoot(int _index) async {
    if (!Get.find<AuthService>().isAuth && _index > 0) {
      await Get.toNamed(Routes.LOGIN);
    }
    currentIndex.value = _index;
    await refreshPage(_index);
    await Get.offNamedUntil(Routes.ROOT, (Route route) {
      if (route.settings.name == Routes.ROOT) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  Future<void> changePage(int _index) async {
    if (Get.currentRoute == Routes.ROOT) {
      await changePageInRoot(_index);
    } else {
      await changePageOutRoot(_index);
    }
  }

  Future<void> refreshPage(int _index) async {
    switch (_index) {
      case 0:
        {
          await Get.find<HomeController>().refreshHome();
          break;
        }
      case 1:
        {
          await Get.find<BookingsController>().refreshBookings();
          break;
        }
      case 2:
        {
          await Get.find<MessagesController>().refreshMessages();
          break;
        }
    }
  }

  void getNotificationsCount() async {
    notificationsCount.value = await _notificationRepository.getCount();
  }

  Future<void> getCustomPages() async {
    customPages.assignAll(await _customPageRepository.all());
  }

  viewCart() async {
    // // isLoading.value = true;
    // this.eServices.clear();
    // this.eServices.addAll(await _carttRepository.viewCart());
   
   
   
    // isLoading.value = false;
  }
}
