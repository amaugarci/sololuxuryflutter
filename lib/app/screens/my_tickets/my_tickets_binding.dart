import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/my_ticket_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/my_ticket_api_repository.dart';


import 'my_tickets_controller.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController(myTicketAPIRepository: Get.find()));
    Get.lazyPut<MyTicketAPIProvider>(() => MyTicketAPIProvider());
    Get.put(MyTicketAPIRepository(myTicketAPIProvider: Get.find()));
  }
}
