import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../components/headline_body_one_base_widget.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';

class NewsLetterScreen extends StatelessWidget {
   NewsLetterScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: appColorAccent,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity,80),
        child: Container(
          color: appColorAccent,
            padding: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top,
                left: 10.0,
                right: 15.0,
                bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        print("onTap ->");
                        if (!scaffoldkey.currentState!.isDrawerOpen) {
                          scaffoldkey.currentState!.openDrawer();
                        }
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        child: Center(
                          child: Image.asset(
                            AppAsset.menu,
                            height: 20.0,
                            width: 20.0,
                            color: appColorPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
               Expanded(
                   flex: 6,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset(
                     AppAsset.logo,
                     height: 30.0,
                     //width: 20.0,
                   ),
                   Row(
                     children: [
                       InkWell(
                         onTap: () {
                           Get.toNamed(RoutesConstants.cartScreen);
                         },
                         child: SvgPicture.asset(
                           AppAsset.search,
                           height: 20.0,
                           width: 20.0,
                           color: Colors.black,
                         ),
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       InkWell(
                         onTap: () {
                           Get.toNamed(RoutesConstants.cartScreen);
                         },
                         child: Image.asset(
                           AppAsset.heartIcon,
                           height: 30.0,
                           width: 20.0,
                           color: Colors.black,
                         ),
                       ),
                       const SizedBox(
                         width: 10,
                       ),
                       InkWell(
                         onTap: () {
                           Get.toNamed(RoutesConstants.cartScreen);
                         },
                         child: SvgPicture.asset(
                           AppAsset.cart,
                           height: 20.0,
                           width: 20.0,
                           color: Colors.black,
                         ),
                       ),
                     ],
                   ),
                 ],
               ))

              ],
            ),

        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (String? value) {
                 // controller.selectedValue.value = value.toString();
                },
                icon: Image.asset(AppAsset.downArrow,
                    height: 16, width: 16.0,color: appColorButton,),
                //value: controller.selectedValue.value,
                hint: Text("My Account",style: TextStyle(
                    color:appColorButton
                ),),
                style: TextStyle(
                  color:appColorButton
                ),
                items: <String>["Mr.", "Mrs."]
                    .map(
                      (String value) => DropdownMenuItem<String>(
                    child: HeadlineBodyOneBaseWidget(
                      title: value,
                      fontSize: 14,
                    ),
                    value: value,
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text("Communication Prefences",style: TextStyle(
              color:appColorButton,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(
            height: 20,
          ),
          Text("Subscribe to be the first with our new arivals,\nexclusive collections, offers and more.",style: TextStyle(
              color: Colors.black,
              fontSize: 13.5,
              fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Subscribe to ounass newsletters..",style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                checkBoxContainer("Email"),
                SizedBox(width: 30,),
                checkBoxContainer("Sms"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(20),
              color: appColorButton
    ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: (){

                },
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text("Save",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row checkBoxContainer(String text) {
    return Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColorButton,
                  width: 1.5
                )
              ),
              child: Icon(Icons.check,color: appColorButton,size: 12,),
            ),
            SizedBox(
              width: 10,
            ),
            Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: appColorButton), )
          ],
        );
  }
}
