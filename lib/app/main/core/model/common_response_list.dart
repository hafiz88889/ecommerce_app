import 'base_response_model.dart';

class CommonResponseList<T> extends BaseResponseModel {
  List<T>? _result;
  CommonResponseList({List<T>? result,}){
    _result = result;
  }

  List<T>? get result => _result;
  set result(List<T>? resultList) => _result = result;

  CommonResponseList.fromJson(super.json, T Function(Map<String, dynamic>) fromJsonT): _result = (json['result'] as List<dynamic>?)?.map((item) => fromJsonT(item as Map<String, dynamic>)).toList(), super.fromJson();

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'result': _result,
    };
  }
}
