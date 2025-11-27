import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_bloc.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_event.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_state.dart';
import 'package:ecommerce_app/app/main/module/home_screen/bloc/home_bloc.dart';
import 'package:ecommerce_app/app/main/module/home_screen/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state){
          },
          builder: (context, state) {
            return SafeArea(child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              ElevatedButton(onPressed: (){
                context.read<AuthBloc>().add(AuthLogOut() as AuthEvent);
              }, child: Text("LogOut"))
            ],));
          }, ),
    );
  }
}
