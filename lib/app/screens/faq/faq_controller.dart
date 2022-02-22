import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/requests/faq_content.dart';

class FaqController extends GetxController {
  var faqContentData = <FaqModel>[].obs;
  var faqContentDetails = <FaqModel>[].obs;
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<FaqModel>> getHomeProducts() async {
    List<FaqModel> faqList = [];

    Map<String, dynamic> data = await faqContentRequest();
    if (data['items'] != null) {
      for (int i = 0; i < data['data'].length; i++) {
        Map<String, dynamic> item = data['data'][i];
        int id = item['id'];

        int index = faqList.indexWhere((element) => element.id == id);

        if (index == -1) {
          faqList.add(FaqModel(
            id: item['id'],
            identifier: item['identifier'],
            title: item['title'],
            pageLayout: item['pageLayout'],
            metaTitle: item['metaTitle'],
            metaKeywords: item['metaKeywords'],
            metaDescription: item['metaDescription'],
            contentHeading: item['contentHeading'],
            content: item['content'],
            creationTime: item['creationTime'],
            updateTime: item['updateTime'],
            sortOrder: item['sortOrder'],
            layoutUpdateXml: item['layoutUpdateXml'],
            customTheme: item['customTheme'],
            customRootTemplate: item['customRootTemplate'],
            active: item['active'],
          ));
        }
      }
      faqContentDetails.value = faqList;
      faqContentDetails.refresh();
    }

    return faqList;
  }
}
