import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wdr/app/views/anaytics/analytics_screen.dart';
import 'package:wdr/app/views/booking/bookings_screen.dart';
import 'package:wdr/app/views/customers/customers_screen.dart';
import 'package:wdr/app/views/dashboard/dashboard_view.dart';
import 'package:wdr/app/views/authentication/login_view.dart';
import 'package:wdr/app/views/rentals/rental_screen.dart';
import 'package:wdr/app/views/settings/setting_view.dart';
import 'package:wdr/app/views/splash_screen.dart';

class AppPages {
  static const initial = '/login';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashView()),
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/dashboard', page: () => DashboardView()),
    GetPage(name: '/rentals', page: () => RentalView()),
    GetPage(name: '/customers', page: () => CustomersView()),
    GetPage(name: '/bookings', page: () => BookingsView()),
    GetPage(name: '/analytics', page: () => AnalyticsView()),
    GetPage(name: '/settings', page: () => SettingsView()),
  ];
}
