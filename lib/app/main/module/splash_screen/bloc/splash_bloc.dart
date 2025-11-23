import 'package:ecommerce_app/app/main/module/splash_screen/bloc/splash_event.dart';
import 'package:ecommerce_app/app/main/module/splash_screen/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashEvent, SplashScreenStat>{

  SplashScreenBloc():super(SplashScreenStat()){

  }
}