import 'package:get_storage/get_storage.dart';

class StorageHelper {
  StorageHelper._();
  static final StorageHelper storageHelper = StorageHelper._();

  GetStorage storage = GetStorage();

  String _first = "first";

  bool get isFirstItem {
    return storage.read(_first) ?? true;
  }

  firstDone() {
    storage.write(_first, false);
  }
}
