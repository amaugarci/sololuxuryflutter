import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';
import '../APIProviders/dashboard_api_provider.dart';
import '../repository_adapter.dart';

class DashboardAPIRepository implements IDashboardRepository {

  final DashboardAPIProvider dashboardAPIProvider;

  DashboardAPIRepository({required this.dashboardAPIProvider});

  @override
  Future<MenuModel> getMenuAPIResponse() async {
    final response = await dashboardAPIProvider.getMenuResponseProvider(endPoint: AppConstants.menuEndPoint);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }

}
