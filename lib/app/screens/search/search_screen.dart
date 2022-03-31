import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/screens/search/widget/product.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../../data/model/search/get_product_data_model.dart';
import '../../../utils/image_constant.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import 'search_controller.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart'
    as custom;

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ChildrenData itemLevel1;
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              controller.scaffoldKey.value.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(ImageConstant.menuIcon),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.searchIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.heartIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                    color: Colors.black),
              ),
            ),
          ],
          title: Image.asset(AppAsset.logo, width: 110),
        ),
        body: controller.menuModel?.value?.childrenData == null
            ? Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //  filterWidget(),
                    const SizedBox(height: 15),
                    filterDropDown(),
                    const SizedBox(height: 10),
                    Flexible(
                      flex: 2,
                      child: controller.controllerText.value.isNotEmpty
                          ? GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 12.5,
                                childAspectRatio: 0.55,
                              ),
                              itemBuilder: (_, index) {
                                Items? item = controller
                                    .searchProductList.value.items?[index];
                                if (item == null) {
                                  return const Text("NO SUCH DATA FOUND");
                                } else {
                                  return productListDesign(product: item);
                                }
                              },
                              itemCount: controller
                                  .searchProductList.value.items!.length,
                            )
                          /* */
                          : DefaultTabController(
                              length: controller
                                  .menuModel?.value?.childrenData?.length,
                              // length of tabs
                              initialIndex: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      child: TabBar(
                                        indicatorColor: buttoncolor,
                                        labelColor: selectedTabColor,
                                        unselectedLabelColor:
                                            unselectedTabColor,
                                        isScrollable: true,
                                        tabs: List<Widget>.generate(
                                          controller.menuModel?.value
                                              ?.childrenData?.length,
                                          (int index) {
                                            itemLevel1 = controller.menuModel
                                                ?.value?.childrenData?[index];
                                            return Tab(
                                                child: Text(itemLevel1.name!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0)));
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: List<Widget>.generate(
                                          controller.menuModel?.value
                                              ?.childrenData?.length,
                                          (int index1) {
                                            return ListView.builder(
                                              itemCount: controller
                                                  .menuModel
                                                  ?.value
                                                  ?.childrenData?[index1]
                                                  .childrenData
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                var data2 = controller
                                                    .menuModel
                                                    ?.value
                                                    ?.childrenData?[index1]
                                                    .childrenData[index];
                                                print("-=============");
                                                return custom.ExpansionTile(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  verticalVisualDensity: -1,
                                                  title: Text(
                                                    "${data2.name}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount: data2
                                                            .childrenData!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index2) {
                                                          ChildrenData
                                                              itemLevel3 =
                                                              data2.childrenData![
                                                                  index2];
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  RoutesConstants
                                                                      .productListScreen,
                                                                  arguments: [
                                                                    itemLevel3
                                                                        .id,
                                                                    itemLevel1
                                                                        .name
                                                                  ]);
                                                            },
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          40.0,
                                                                      top: 3.0,
                                                                      bottom:
                                                                          3.0),
                                                              child: Text(
                                                                itemLevel3
                                                                    .name!,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        appColorDarkGrey),
                                                              ),
                                                            ),
                                                          );
                                                        })
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }

  Widget productListDesign({var product}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: product);
      },
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210,
              //padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColor,
                  width: 1.4,
                ),
              ),
              child: Stack(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    "${AppConstants.productImageUrl}${product!.customAttributes![1].value}",
                    height: 210,
                    width: 210,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          AppAsset.heart,
                          height: 14,
                          color: appColor,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product?.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Text(
              "${product?.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + "${product?.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$' + "${product?.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filterDropDown() {
    return Container(
      height: 50,
      width: Get.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: appColor, width: 1.4),
      ),
      child: TextFormField(
        controller: controller.txtList,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          border: InputBorder.none,
          hintText: LanguageConstant.searchText.tr,
          hintStyle: const TextStyle(color: Colors.black54),
        ),
        onChanged: (val) {
          controller.getSearchData(argument: val);
        },
      ),
    );
  }
}
