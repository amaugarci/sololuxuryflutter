import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_divider.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/screens/profile/profile_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';


class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSubscribeButtonColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            appBarWidget(),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 90.0, left: 30.0, right: 25.0),
              child: ListView.builder(
                itemCount: controller.profileMenu.length,
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Container(
                    height: 30.0,
                    width: 30.0,
                    margin: EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextOpenSans(
                          "${controller.profileMenu[index]}",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                        Center(
                          child: Image.asset(
                            AppAsset.downArrow,
                            height: 16.0,
                            width: 16.0,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  appBarWidget() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 15.0),
      child: Column(
        children: [
          CommonTextOpenSans(
            LanguageConstant.myAccountText.tr,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: appColorPrimary,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15.0,
          ),
          CommonDivider(color: appColorPrimary,),
        ],
      ),
    );
  }
}
