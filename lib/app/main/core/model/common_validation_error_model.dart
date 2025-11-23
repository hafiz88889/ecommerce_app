class CommonValidationErrors {
  String? _message;
  List<String>? _members;

  CommonValidationErrors({String? message, List<String>? members}) {
    if (message != null) {
      this._message = message;
    }
    if (members != null) {
      this._members = members;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  List<String>? get members => _members;
  set members(List<String>? members) => _members = members;

  CommonValidationErrors.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _members = json['members'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['members'] = this._members;
    return data;
  }
}

