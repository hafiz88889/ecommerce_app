import 'package:ecommerce_app/app/main/core/model/request_body.dart';
import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable{}

class LoadSplashScreen extends SplashEvent{
  final RequestBody requestBody;
  LoadSplashScreen({required this.requestBody});

  @override
  // TODO: implement props
  List<Object?> get props => [requestBody];
}