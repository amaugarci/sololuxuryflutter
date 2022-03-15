enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  static String apiEndPoint = "https://www.sololuxury.com/rest/V1/";
  // static String apiEndPoint =
  //     "http://solo_luxury-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  //Sign Up
  static String login = 'integration/customer/token';
  static String addAddress = 'customers/me';
  static String countryList = 'directory/countries';
}
