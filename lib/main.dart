import 'package:ecommerce_app/app/route/app_route.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce App",
      routerConfig: AppRouter.appRouter,
    );
  }
}
