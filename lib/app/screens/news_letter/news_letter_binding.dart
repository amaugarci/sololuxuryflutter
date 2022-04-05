
import 'package:get/get.dart';

import 'news_letter_controller.dart';

class NewsLetterBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut(() => NewsLetterAPIProvider());
    Get.put(NewsLetterAPIRepository(newsLetterAPIProvider: Get.find()));
    Get.lazyPut(() => NewsLetterController(newsLetterAPIRepository: Get.find()));
  }

}