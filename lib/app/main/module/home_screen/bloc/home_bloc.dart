import 'package:ecommerce_app/app/main/module/home_screen/bloc/home_event.dart';
import 'package:ecommerce_app/app/main/module/home_screen/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc():super(HomeState()){

  }
}