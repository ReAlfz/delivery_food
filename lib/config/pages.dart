import 'package:delivery_food/config/route.dart';
import 'package:delivery_food/modules/auth/bindings/login_binding.dart';
import 'package:delivery_food/modules/auth/bindings/register_binding.dart';
import 'package:delivery_food/modules/auth/view/login_view.dart';
import 'package:delivery_food/modules/auth/view/register_view.dart';
import 'package:delivery_food/modules/checkout/bindings/checkout_binding.dart';
import 'package:delivery_food/modules/checkout/view/checkout_view.dart';
import 'package:delivery_food/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:delivery_food/modules/dashboard/view/dashboard_view.dart';
import 'package:delivery_food/modules/menu/detail_menu/bindings/detail_menu_binding.dart';
import 'package:delivery_food/modules/menu/detail_menu/view/detail_menu_view.dart';
import 'package:delivery_food/modules/menu/list_menu/view/search_view.dart';
import 'package:delivery_food/modules/order/detail_order/bindings/detail_order_binding.dart';
import 'package:delivery_food/modules/order/detail_order/view/detail_order_view.dart';
import 'package:delivery_food/modules/splash_screen/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages() {
    return [
      GetPage(
        name: AppRoutes.splashScreenView,
        page: () => const SplashView(),
      ),

      // auth route //
      GetPage(
        name: AppRoutes.loginView,
        page: () => const LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.registerView,
        page: () => const RegisterView(),
        binding: RegisterBinding(),
      ),

      // dashboard route //
      GetPage(
        name: AppRoutes.dashboardView,
        page: () => const DashboardView(),
        binding: DashboardBinding(),
      ),
      GetPage(
        name: AppRoutes.checkoutView,
        page: () => const CheckoutView(),
        binding: CheckoutBinding(),
      ),
      GetPage(
        name: AppRoutes.searchView,
        page: () => const SearchView(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: Transition.fadeIn,
      ),

      // detail menu route //
      GetPage(
        name: AppRoutes.detailMenuView,
        page: () => const DetailMenuView(),
        binding: DetailMenuBinding(),
      ),
      GetPage(
        name: AppRoutes.detailOrderView,
        page: () => const DetailOrderView(),
        binding: DetailOrderBinding(),
      ),
    ];
  }
}
