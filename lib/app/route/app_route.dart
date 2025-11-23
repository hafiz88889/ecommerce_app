import 'package:ecommerce_app/app/main/module/splash_screen/view/splash_page_view.dart';
import 'package:ecommerce_app/app/route/app_path.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
  AppRouter._();
  
  static final GoRouter appRouter =GoRouter(
    initialLocation: Routes.SPLASH_SCREEN,
    routes: [
    GoRoute(
      path: Routes.SPLASH_SCREEN,
      builder: (context, state) => const SplashPageView(),
    )
    ]
  );
}