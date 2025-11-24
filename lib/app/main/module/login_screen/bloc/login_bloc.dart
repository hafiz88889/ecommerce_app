import 'package:ecommerce_app/app/main/module/login_screen/bloc/login_event.dart';
import 'package:ecommerce_app/app/main/module/login_screen/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBloc extends Bloc<LoginEvent, LogIngState>{
  LogInBloc():super(LogIngState()){

  }
}