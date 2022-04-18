import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/requests/faq_content.dart';

import '../../../utils/get_network_service/APIRepository/faq_api_repository.dart';

class FaqController extends GetxController {
  var faqContentData = ''.obs;
  var faqModel = FaqModel().obs;
  RxInt index = 0.obs;

  final FaqAPIRepository faqAPIRepository;
  RxList<CmsText> getFaqList = RxList<CmsText>();
  FaqController({required this.faqAPIRepository});

  @override
  void onInit() {
    super.onInit();
    getFaqContent();

  }

  // void getFaqContent() async {
  //   var faqContent = await FaqContentReq.fetchFaqData();
  //   if (faqContent != null) {
  //     faqContentData.value = faqContent;
  //   }
  // }

   getFaqContent() async {
   var itemsData = await faqAPIRepository.getFaqApiResponse();
    final subItemsData =await itemsData[0]["cms_text"];
   print("ITEAM DATA +++++++++++++++${subItemsData.length}");
   getFaqList.value = List<CmsText>.from(
       subItemsData.map((countryList) => CmsText.fromJson(countryList)));
    print("ITEAM DATA +++++++++++++++${getFaqList.length}");
    // faqModel=JsonDecoder(itemsData);
  }

  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;
  var isSelected4 = false.obs;
  var isSelected5 = false.obs;
// Future<List<FaqModel>> getFaqContent() async {
//   List<FaqModel> faqList = [];

//   Map<String, dynamic> data = await faqContentRequest();
//   if (data['items'] != null) {
//     for (int i = 0; i < data['data'].length; i++) {
//       Map<String, dynamic> item = data['data'][i];
//       int id = item['id'];

//       int index = faqList.indexWhere((element) => element.id == id);

//       if (index == -1) {
//         faqList.add(FaqModel(
//           id: item['id'],
//           identifier: item['identifier'],
//           title: item['title'],
//           pageLayout: item['pageLayout'],
//           metaTitle: item['metaTitle'],
//           metaKeywords: item['metaKeywords'],
//           metaDescription: item['metaDescription'],
//           contentHeading: item['contentHeading'],
//           content: item['content'],
//           creationTime: item['creationTime'],
//           updateTime: item['updateTime'],
//           sortOrder: item['sortOrder'],
//           layoutUpdateXml: item['layoutUpdateXml'],
//           customTheme: item['customTheme'],
//           customRootTemplate: item['customRootTemplate'],
//           active: item['active'],
//         ));
//       }
//     }
//     faqContentDetails.value = faqList;
//     faqContentDetails.refresh();
//   }

//   return faqList;
// }
}
