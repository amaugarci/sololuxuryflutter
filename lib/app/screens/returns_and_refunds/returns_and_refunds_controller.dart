import 'package:get/get.dart';
import 'package:solo_luxury/data/model/returnsRefunds/returns_refunds_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/returns_refunds_api_repository.dart';

class ReturnsAndRefundsController extends GetxController {
  RxList<CmsText> getReturnsList = RxList<CmsText>();
  ReturnsRefundAPIRepository refundAPIRepository;

  ReturnsAndRefundsController({required this.refundAPIRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReturnsRefundsContent();
  }

  var isSelected1 = false.obs;
  var isSelected2 = false.obs;
  var isSelected3 = false.obs;
  var isSelected4 = false.obs;
  var isSelected5 = false.obs;

  getReturnsRefundsContent() async {
    var itemsData = await refundAPIRepository.getReturnsRefundsApiResponse();
    final subItemsData = await itemsData[0]["cms_text"];
    print("ITEAM DATA +++++++++++++++${subItemsData.length}");
    getReturnsList.value = List<CmsText>.from(
        subItemsData.map((countryList) => CmsText.fromJson(countryList)));
    print("ITEAM DATA +++++++++++++++${getReturnsList.length}");
  }
}
