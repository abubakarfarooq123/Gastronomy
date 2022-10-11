import 'package:get/get.dart';
import 'package:reserved4u/Helper/NotificatiokKeys.dart';
import 'package:reserved4u/Helper/preferences.dart';

import 'BookingSummaryModel.dart';

class BookingSummaryController extends GetxController {
  var bookingSummaryObj = BookingSummaryData();
  var servcesIcon = true.obs;

  @override
  void onInit() async {
    super.onInit();
    bookingSummaryObj = Get.arguments;
    Preferences.preferences
        .saveBool(key: PrefernceKey.isGuestUser, value: false);
  }
}
