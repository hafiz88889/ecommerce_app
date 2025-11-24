import 'package:ecommerce_app/app/main/module/login_screen/bloc/login_bloc.dart';
import 'package:ecommerce_app/app/main/module/login_screen/view/login_view.dart';
import 'package:ecommerce_app/app/main/module/reg_screen/bloc/reg_bloc.dart';
import 'package:ecommerce_app/app/main/module/reg_screen/view/reg_page_view.dart';
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
            create: (context)=>RegBloc(),
            child: const RegPageView(),
          );
        },
      ),
      GoRoute(
        path: Routes.LOGIN_VIEW,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginBloc(authRepository: AuthRepository()),
            child: const LoginPage(),
          );
        },
      ),
    ]
  );
}