import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.put(HomeController(), permanent: true);
    Get.put(BookingsController(), permanent: true);

    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<CarttController>(
      () => CarttController(),
    );
  }
}
