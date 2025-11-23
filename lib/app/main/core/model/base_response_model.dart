

import 'common_error_model.dart';

abstract class BaseResponseModel {
  String? _targetUrl;
  bool? _success;
  CommonErrorModel? _error;
  bool? _unAuthorizedRequest;
  bool? _bAbp;

  BaseResponseModel({
    String? targetUrl,
    bool? success,
    CommonErrorModel? error,
    bool? unAuthorizedRequest,
    bool? bAbp,
  }) {
    _targetUrl = targetUrl;
    _success = success;
    _error = error;
    _unAuthorizedRequest = unAuthorizedRequest;
    _bAbp = bAbp;
  }

  String? get targetUrl => _targetUrl;
  set targetUrl(String? targetUrl) => _targetUrl = targetUrl;

  bool? get success => _success;
  set success(bool? success) => _success = success;

  CommonErrorModel? get error => _error;
  set error(CommonErrorModel? error) => _error = error;

  bool? get unAuthorizedRequest => _unAuthorizedRequest;
  set unAuthorizedRequest(bool? unAuthorizedRequest) =>
      _unAuthorizedRequest = unAuthorizedRequest;

  bool? get bAbp => _bAbp;
  set bAbp(bool? bAbp) => _bAbp = bAbp;

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    _targetUrl = json['targetUrl'];
    _success = json['success'];
    _error = json['error'] != null ? CommonErrorModel.fromJson(json['error']) : null;
    _unAuthorizedRequest = json['unAuthorizedRequest'];
    _bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targetUrl'] = _targetUrl;
    data['success'] = _success;
    if (this._error != null) {
      data['error'] = this._error!.toJson();
    }
    data['unAuthorizedRequest'] = _unAuthorizedRequest;
    data['__abp'] = _bAbp;
    return data;
  }

}

