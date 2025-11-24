import 'package:ecommerce_app/app/main/module/reg_screen/bloc/reg_event.dart';
import 'package:ecommerce_app/app/main/module/reg_screen/bloc/reg_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegBloc extends Bloc<AuthReg, RegPageState>{
  RegBloc():super(RegPageState()){

  }
}