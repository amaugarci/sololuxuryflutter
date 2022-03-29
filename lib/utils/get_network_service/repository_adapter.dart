import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import '../../data/model/Home/menu_model.dart';

import '../../data/model/InfluenceRegistration/influencer_registration_model.dart';
import '../../data/model/Product/product_model.dart';
import '../../data/model/Wishlist/wishlist_model.dart';
import '../../data/model/checkout_order/multi_address_model.dart';

abstract class ISplashRepository {
  Future<String> getSplashAPIResponse();
}

abstract class IReferFriendRepository {
  Future<String> getReferFriendAPIResponse();
}

abstract class ILoginRepository {
  Future<String> getLoginAPIResponse(
      String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<SignUpResponseModel> getSignupAPIResponse(String signupRequestJson);
}

abstract class IInfluencerRepository {
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      String influencerRequestJson);
}

abstract class IDashboardRepository {
  Future<MenuModel> getMenuAPIResponse();
}

abstract class ISearchRepository {
  Future<MenuModel> getMenuAPIResponse();

  Future<BannerListModel> getBannerListAPIResponse();
}

abstract class IHomeRepository {}

abstract class ICountryRepository {
  Future<String> getStoreWebsitesAPIResponse();

  Future<String> getStoreViewsAPIResponse();

  Future<String> getStoreConfigsAPIResponse();
}

abstract class ICheckoutOrderRepository {
  Future<ShippingInformationModel> postShippingInformationAPIResponse(
      String requestJson);
  Future<String> getMultiAddressAPIResponse();
  Future<String> postEstimateAPIResponse(String loginRequestJson);
  Future<String> postCreateOrderAPIResponse(String loginRequestJson);
}

///myAccount Class
abstract class IMyAccountRepository {
  Future<MyAccountDetails> getMyAccountApiResponse();
}

///cart Class
abstract class ICartRepository {
  Future<String> getCartGetDataApiResponse();
  Future<dynamic> deleteCartCartQTYDataApiResponse(String itemId);
}

abstract class IContactUsRepository {
  Future<dynamic> getContactUsApiResponse(
      String contactusRequestJson,
      String orderNo,
      String country,
      String subject,
      String message,
      String sourceOfTicket,
      String phoneNumber,
      String typeOfEnquiry,
      String email,
      String name,
      String lastName);
}

///RecommendedProduct Class
abstract class IRecommendedProductsRepository {
  Future<RecommendedProductModel> getMyAccountApiResponse();
}

abstract class ICountryListRepository {
  Future<String> getCountryListResponse();

  Future<String> postaddAddressApiResponse(String response);
}

abstract class IMyTicketRepository {
  Future<dynamic> getmyTicketApiResponse(String response);
}

abstract class IProductListRepository {
  Future<ProductModel> getProductListApiResponse(String categoryId);
  Future<List<dynamic>> getFilterListApiResponse();
}

abstract class IWishListRepository {
  Future<WishListProductModel> getWishListApiResponse();
}

abstract class IDeleteWishListRepository {
  Future<String> deleteWishListApiResponse(String id);
}

abstract class IFaqRepository {
  Future getFaqApiResponse();
}

abstract class IReturnsAndRefundsRepository {
  Future getReturnsRefundsApiResponse();
}

abstract class IMyOrdersRepository {
  Future<MyOrdersData> getMyOrdersApiResponse();
}

abstract class IPostWishListRepository {
  Future<String> postWishListApiResponse(String sku);
}

abstract class IBrandListRepository {
  Future<String> getBrandListResponse();
}
