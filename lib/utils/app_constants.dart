import 'package:solo_luxury/main.dart';

enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://solo_luxury.virtual-manager-backend.ml";
  static String imageEndPoint = "https://solo_luxury.s3.amazonaws.com/";

  //static String menuEndPoint = "/V1/categories";

  static String bannerListEndPoint = "/bannerList";
  // static String estimatesShippingMethodEndPoint = "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint = "/in-en/V1/carts/mine/shipping-information";
  static String multiAddressEndPoint = "/rest/V1/customers/me";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String referFriendEndPoint = "/V1/referFriend";

  // static String menuEndPoint = "/V1/categories";
  // static String estimatesShippingMethodEndPoint =
  //     "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint =
  //     "/in-en/V1/carts/mine/shipping-information";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String jsonEndPoint = "/json";

  static String apiEndPointNew2 = "https://dev3.sololuxury.com/rest";
  static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";
  static String recommendedProductsEndPoint =
      "https://dev3.sololuxury.com/rest/V1/recommendedList?sku=4996230JNAN-Blue";

  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";
  static String storeWebsitesEndPoint = "/rest/V1/store/websites";
  static String storeViewsEndPoint = "/rest/V1/store/storeViews";
  static String storeConfigsEndPoint = "/rest/V1/store/storeConfigs";
  static String referFriendEndPoint = "/rest//V1/referFriend";

  static String jsonEndPoint = "/json";

  //static String apiEndPointNew2 = "https://dev3.sololuxury.com/rest";
  //static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  // static String apiEndPointMyAccount = "https://dev2.brands-labels.com/rest/V1/customers/me";

  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";
  static String apiEndPointNew = "https://www.sololuxury.com/rest";

  static String apiEndPoint = "";
  //static String apiEndPointLogin = "https://dev3.sololuxury.com";
  static String apiEndPointLogin = "https://www.sololuxury.com";
  static String adminToken = "Bearer 1zo8slf3nn8a1nlijrvbwse53kmvo962";
  static String productImageUrl =
      "https://www.sololuxury.com/media/catalog/product/";

  //static String apiEndPoint = "https://api.solo_luxury.com";
  //static String apiEndPointLogin = "https://dev3.sololuxury.com";
  static String apiEndPointContactUs =
      "https://dev3.sololuxury.com/rest/V1/contactus";

  static String apiCountryGet = "http://ip-api.com";
  static String apiEndPointFaq = "https://dev3.sololuxury.com";
  static String tokenFaq = "Bearer yn6yadqv0l8uem5rvo4pt6invys7gpo8";

  static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  // static String apiEndPoint =
  //     "http://solo_luxury-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up

  //static String login = '/integration/customer/token';

  // static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  // static const String defaultToken1 = "Bearer 7cn032equ94z91iz1ykkeus8ds62twlf";

  //static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  //static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  static String login = '/rest/V1/integration/customer/token';
  static const String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/rest/V1/categories";
  static const String contactUs = "/rest/V1/contactus";

  static const String productList =
      "/rest/default/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static const String wishList = "/rest/V1/wishlist";
  static const String brandList = "/rest/V1/brandList";
  static const String faq = "/rest/V1/cmspagemanagerList/16";
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";
  static const String cartGetData = "/rest/in-en/V1/carts/mine";

  static const String myOrders =
      "/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=devdyna@gmail.com";
  static const String deleteWishlist = "/rest/V1/wishlist/";
  static const String postWishlist = "/rest/V1/wishlist/";

  static const String licenceId = '11434003';

  //static String login = 'integration/customer/token';

  static String addAddress = '/rest/V1/customers/me';
  static String countryList = '/rest/V1/directory/countries';

  static getUrlWithCode(url) {
    return "/rest/" + localStore.currentCode + url;
  }

  static const int websiteId = 1;

  static String myTicketApi = '/rest/V1/mytickets/';
  static const String getSizeListApi = "/V1/sizeList/";

  static const String fontPoppins = 'Poppins';
  static const String fontOpenSans = 'OpenSans';
}
