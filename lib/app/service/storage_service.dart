import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  GetStorage getStorage = GetStorage();

  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  T? read<T>(String key) {
    return getStorage.read(key);
  }

  Future<void> write(String key, dynamic value) {
    return getStorage.write(key, value);
  }
}
