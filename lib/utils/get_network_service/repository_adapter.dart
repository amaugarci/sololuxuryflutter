import 'package:solo_luxury/data/model/Faq/faq_model.dart';
import 'package:solo_luxury/data/model/Home/banner_list_model.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';

import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';

import 'package:solo_luxury/data/model/search/get_product_data_model.dart';
import 'package:solo_luxury/data/model/search/search_model.dart';

import 'package:solo_luxury/data/model/signup_response_model.dart';
import '../../app/screens/product_detail/option/option_model.dart';
import '../../data/model/Home/menu_model.dart';

import '../../data/model/InfluenceRegistration/influencer_registration_model.dart';
import '../../data/model/Product/product_model.dart';
import '../../data/model/Wishlist/wishlist_model.dart';
import '../../data/model/checkout_order/multi_address_model.dart';

abstract class ISplashRepository {
  Future<String> getSplashAPIResponse();
}

abstract class IReferFriendRepository {
  Future<dynamic> getReferFriendAPIResponse();
}

abstract class ILoginRepository {
  Future<dynamic> getLoginAPIResponse(
      String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<dynamic> getSignupAPIResponse(String signupRequestJson);
}

abstract class IInfluencerRepository {
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      String influencerRequestJson);
}

abstract class IDashboardRepository {
  Future<dynamic> getMenuAPIResponse();
}

abstract class ISearchRepository {
  Future<MenuModel> getMenuAPIResponse();

  Future<SearchModel> getSearchAPIResponse();

  Future<ProductModel> getSearchProductAPIResponse();

  // Future<BannerListModel> getBannerListAPIResponse();
}

abstract class IHomeRepository {}

abstract class ICountryRepository {
  Future<dynamic> getStoreWebsitesAPIResponse();

  Future<dynamic> getStoreViewsAPIResponse();

  Future<dynamic> getStoreConfigsAPIResponse();
}

abstract class ICheckoutOrderRepository {
  Future<dynamic> postShippingInformationAPIResponse(String requestJson);

  Future<dynamic> getMultiAddressAPIResponse();

  Future<dynamic> postEstimateAPIResponse(String loginRequestJson);

  Future<dynamic> postCreateOrderAPIResponse(String loginRequestJson);
}

///myAccount Class
abstract class IMyAccountRepository {
  Future<MyAccountDetails> getMyAccountApiResponse();
}

///cart Class
abstract class ICartRepository {
  Future<dynamic> getCartGetDataApiResponse(
    String apiEndPoint,
  );
  Future<dynamic> deleteCartCartQTYDataApiResponse(
      String itemId, String apiEndPOint);
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

///forget password Class
abstract class IForgetPasswordRepository {
  Future<String> putForgetPasswordApiResponse();
}

abstract class ICountryListRepository {
  Future<dynamic> getCountryListResponse();

  Future<dynamic> postaddAddressApiResponse(String response);
}

///orderConfirmation Class
abstract class IOrderConfirmationRepository {
  Future<dynamic> getOrderConfirmationApiResponse();
}

abstract class IMyTicketRepository {
  Future<dynamic> getmyTicketApiResponse(String response);
}

abstract class IProductListRepository {
  Future<ProductModel> getProductListApiResponse(String categoryId);
  Future<List<dynamic>> getOptionsListApiResponse();

  Future<List<dynamic>> getFilterListApiResponse(String id);
}

abstract class IWishListRepository {
  Future<WishListProductModel> getWishListApiResponse();
}

abstract class IDeleteWishListRepository {
  Future<dynamic> deleteWishListApiResponse(String id);
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
  Future<dynamic> postWishListApiResponse(String sku);
}

abstract class IBrandListRepository {
  Future<dynamic> getBrandListResponse();
}

abstract class IPrivacyPolicyRepository {
  Future<dynamic> getPrivacyPolicyResponse();
}

abstract class ITermAndConditionRepository {
  Future<dynamic> getTermAndConditionResponse();
}

abstract class IAddressListRepository {
  Future<dynamic> getAddressListResponse();
}

abstract class IReturnReasonRepository {
  Future<dynamic> getReturnReasonResponse();
  Future<dynamic> postReturnItemAPIResponse(String orderId, String productsku,
      String email, String reason, String langCode);
  Future<dynamic> getOrderTeakingResponse(String id);
}
