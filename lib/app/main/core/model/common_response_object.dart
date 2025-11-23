import 'base_response_model.dart';

class CommonResponseObject<T> extends BaseResponseModel {
  T? _result;

  CommonResponseObject({
    T?  result,
  }){
    if(result != null){
      _result = result;
    }
  }


  T? get result => _result;

  set result(T? result) => _result = result;

  CommonResponseObject.fromJson(super.json, T Function(Map<String, dynamic>) fromJsonT)
      : _result = _parseResult(json['result'], fromJsonT),
        super.fromJson();

  static T? _parseResult<T>(dynamic result, T Function(Map<String, dynamic>) fromJsonT) {
    if (result == null) {
      return null;
    }

    if (result is String || result is bool) {
      // If it's a simple type (String or bool), just return it
      return result as T;
    } else if (result is Map<String, dynamic>) {
      // If it's a Map, use the fromJsonT function to parse it
      return fromJsonT(result);
    }

    return null;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'result': _result,
    };
  }
}
