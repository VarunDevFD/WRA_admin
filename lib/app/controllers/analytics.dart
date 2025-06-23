import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AnalyticsController extends GetxController {
  final RxList<int> monthlyRevenue = <int>[].obs;
  final RxList categoryStats = [].obs;
  final RxList<double> customerGrowth = <double>[].obs;
}
