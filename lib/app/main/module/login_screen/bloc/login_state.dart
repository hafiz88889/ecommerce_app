import 'package:equatable/equatable.dart';

import '../../../core/model/request_body.dart';

enum LogInStatus{initial,loading,success,error,onData}
class LogInState extends Equatable{
  final LogInStatus logInStatus;
  final RequestBody? requestBody;
  final int? totalCount;
  final String? error;

  const LogInState({this.logInStatus = LogInStatus.initial,
    this.requestBody,
    this.totalCount,
    this.error});


  LogInState copyWith({
    LogInStatus? logInStatus,
    RequestBody? requestBody,
    int? totalCount,
    String? error,
  }){
    return LogInState(
      logInStatus: logInStatus?? this.logInStatus,
      requestBody:  requestBody?? this.requestBody,
      totalCount: totalCount?? this.totalCount,
      error:  error?? this.error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [logInStatus,requestBody,totalCount,error];
}