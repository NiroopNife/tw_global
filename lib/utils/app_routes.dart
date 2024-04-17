import 'package:get/get.dart';
import 'package:tw_global/presentation/view/dashboard.dart';
import 'package:tw_global/presentation/view/detail_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => const Dashboard(), transition: Transition.fade),
    GetPage(name: '/detail', page: () => const DetailsScreen(), transition: Transition.rightToLeftWithFade),
  ];
}
