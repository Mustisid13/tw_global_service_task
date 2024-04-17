import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global_service_task/features/homepage/view/FullImageView.dart';
import 'package:tw_global_service_task/features/homepage/view/HomePageView.dart';

import '../../features/homepage/view/controller/HomeBindings.dart';
import 'AppRouterName.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRouterName.home:
      return getPageRoutes(
          page: () => const HomePageView(),
          routeName: AppRouterName.home,
          settings: settings,
          bindings: [HomeBindings()]);
    case AppRouterName.fullImage:
      return getPageRoutes(
          page: () => const FullImageView(),
          routeName: AppRouterName.fullImage,
          settings: settings,
          bindings: [HomeBindings()]);
    default:
      return getPageRoutes(
          page: () => Scaffold(
                body: Center(child: Text("${settings.name} page not found")),
              ),
          routeName: AppRouterName.home,
          settings: settings,
          bindings: []);
  }
}

Route getPageRoutes(
    {required String routeName,
    required Widget Function() page,
    required RouteSettings settings,
    List<Bindings>? bindings}) {
  return GetPageRoute(
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      page: page,
      routeName: routeName,
      settings: settings,
      bindings: bindings);
}
