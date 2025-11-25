
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_bloc.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/view/login_page.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/view/reg_page_view.dart';
import 'package:ecommerce_app/app/main/module/home_screen/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/main/module/home_screen/view/home_page_view.dart';
import 'package:ecommerce_app/app/main/module/splash_screen/view/splash_page_view.dart';
import 'package:ecommerce_app/app/main/share/firebase_auth_repository.dart';
import 'package:ecommerce_app/app/route/app_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
  AppRouter._();
  
  static final GoRouter appRouter =GoRouter(
    initialLocation: Routes.SPLASH_SCREEN,
    routes: [
    GoRoute(
      path: Routes.SPLASH_SCREEN,
      builder: (context, state) => const SplashPageView(),
    ),
      GoRoute(
        path: Routes.REG_SCREEN,
        builder: (context, state) {
          return BlocProvider(
            create: (context)=>AuthBloc(AuthRepository()),
            child: const RegPageView(),
          );
        },
      ),
      GoRoute(
        path: Routes.LOGIN_VIEW,
        builder: (context, state) {
          return BlocProvider(
            create: (context)=>AuthBloc(AuthRepository()),
            child: const LoginPageView(),
          );
        },
      ),
      GoRoute(
        path: Routes.HOME_PAGE_VIEW,
        builder: (context, state) {
          return BlocProvider(
            create: (context)=>HomeBloc(),
            child: const HomePageView(),
          );
        },
      ),
    ]
  );
}