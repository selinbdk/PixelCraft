import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixelcraft/core/collections/image_response_collection.dart';
import 'package:pixelcraft/view/discover_view.dart';
import 'package:pixelcraft/view/onboarding_view.dart';
import 'package:pixelcraft/view/result_view.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: DiscoverRoute.page,
        ),
        AutoRoute(
          page: ResultRoute.page,
        ),
      ];
}
