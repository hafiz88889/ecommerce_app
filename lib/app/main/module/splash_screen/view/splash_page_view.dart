import 'package:ecommerce_app/app/route/app_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      context.push(Routes.REG_SCREEN);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Colors.black,),
      ),
    );
  }
}
