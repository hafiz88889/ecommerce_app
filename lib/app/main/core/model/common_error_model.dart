
import 'common_validation_error_model.dart';

class CommonErrorModel {
  int? _code;
  String? _message;
  String? _details;
  List<CommonValidationErrors>? _validationErrors;

  CommonErrorModel(
      {int? code,
        String? message,
        String? details,
        List<CommonValidationErrors>? validationErrors}) {
    if (code != null) {
      this._code = code;
    }
    if (message != null) {
      this._message = message;
    }
    if (details != null) {
      this._details = details;
    }
    if (validationErrors != null) {
      this._validationErrors = validationErrors;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get details => _details;
  set details(String? details) => _details = details;
  List<CommonValidationErrors>? get validationErrors => _validationErrors;
  set validationErrors(List<CommonValidationErrors>? validationErrors) =>
      _validationErrors = validationErrors;

  CommonErrorModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _details = json['details'];
    if (json['validationErrors'] != null) {
      _validationErrors = <CommonValidationErrors>[];
      json['validationErrors'].forEach((v) {
        _validationErrors!.add(CommonValidationErrors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    data['details'] = this._details;
    if (this._validationErrors != null) {
      data['validationErrors'] =
          this._validationErrors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}