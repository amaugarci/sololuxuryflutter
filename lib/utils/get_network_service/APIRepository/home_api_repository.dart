import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/signup_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../../data/model/Home/menu_model.dart';
import '../APIProviders/home_api_provider.dart';

class HomeAPIRepository implements IHomeRepository {

  final HomeAPIProvider homeAPIProvider;

  HomeAPIRepository({required this.homeAPIProvider});


}
