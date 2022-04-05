import 'package:get/get.dart';

import '../../../utils/get_network_service/APIRepository/signup_api_repository.dart';

class NewsLetterController extends GetxController {
  final NewsLetterAPIRepository newsLetterAPIRepository;

  NewsLetterController({required this.newsLetterAPIRepository});
}