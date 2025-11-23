class RequestBody {
  bool? _isApproved;
  bool? _isUnApproved;
  String? _filter = "";
  String? _permission = "";
  String? _role ="";
  int _skipCount = 0;
  int _maxResultCount = 10;
  String? _sorting;
  int? _currentPage = 0;
  String? _fromDate;
  String? _toDate ;
  int? _memberId;
  int? _memberForId;
  int? _monthNo;
  int? _yearNo;
  bool? _isUserAvailable;

  RequestBody(
      {String? filter,
        bool? isApproved,
        bool? isUnApproved,
        String? permission,
        String? role,
        int? skipCount,
        int? maxResultCount,
        String? sorting,
        String? fromDate,
        int? currentPage,
        String? toDate,
        int? memberId,
        int? memberForId,
        int? monthNo,
        int? yearNo,
        bool? isUserAvailable,
      }) {
    if (filter != null) {
      this._filter = filter;
    }
    if (permission != null) {
      this._permission = permission;
    }
    if (role != null) {
      this._role = role;
    }
    if (skipCount != null) {
      this._skipCount = skipCount;
    }
    if (maxResultCount != null) {
      this._maxResultCount = maxResultCount;
    }
    if (sorting != null) {
      this._sorting = sorting;
    }
    if (fromDate != null) {
      this._fromDate = fromDate;
    }
    if (toDate != null) {
      this._toDate = toDate;
    }
    if (isApproved != null) {
      this._isApproved = isApproved;
    }
    if (isUnApproved != null) {
      this._isUnApproved = isUnApproved;
    }
    if (currentPage != null) {
      this._currentPage= currentPage;
    }
    if (memberId != null) {
      this._memberId= memberId;
    }
    if (memberForId != null) {
      this._memberForId= memberForId;
    }
    if (monthNo != null) {
      this._monthNo= monthNo;
    }
    if (yearNo != null) {
      this._yearNo= yearNo;
    }
    if (isUserAvailable != null) {
      this._isUserAvailable = isUserAvailable;
    }
  }

  String? get filter => _filter;
  set filter(String? filter) => _filter = filter;
  String? get permission => _permission;
  set permission(String? permission) => _permission = permission;
  String? get role => _role;
  set role(String? role) => _role = role;
  int get skipCount => _skipCount;
  set skipCount(int skipCount) => _skipCount = skipCount;
  int get maxResultCount => _maxResultCount;
  set maxResultCount(int maxResultCount) => _maxResultCount = maxResultCount;
  String? get sorting => _sorting;
  set sorting(String? sorting) => _sorting = sorting;
  String? get fromDate => _fromDate;
  set fromDate(String? fromDate) => _fromDate = fromDate;
  String? get toDate => _toDate;
  set toDate(String? toDate) => _toDate = toDate;
  bool? get isApproved => _isApproved;
  set isApproved(bool? isApproved) => _isApproved = isApproved;
  bool? get isUnApproved => _isUnApproved;
  set isUnApproved(bool? isUnApproved) => _isUnApproved = isUnApproved;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  int? get memberId => _memberId;
  set memberId(int? memberId) => _memberId = memberId;
  int? get memberForId => _memberForId;
  set memberForId(int? memberForId) => _memberForId = memberForId;
  int? get monthNo => _monthNo;
  set monthNo(int? monthNo) => _monthNo = monthNo;
  int? get yearNo => _yearNo;
  set yearNo(int? yearNo) => _yearNo = yearNo;
  bool? get isUserAvailable => _isUserAvailable;
  set isUserAvailable(bool? isUserAvailable) => _isUserAvailable = isUserAvailable;


  RequestBody.fromJson(Map<String, dynamic> json) {
    _filter = json['filter'];
    _permission = json['permission'];
    _role = json['role'];
    _skipCount = json['skipCount'];
    _maxResultCount = json['maxResultCount'];
    _sorting = json['sorting'];
    _fromDate = json['fromDate'];
    _toDate = json['toDate'];
    _isApproved = json['isApproved'];
    _isUnApproved = json['isUnApproved'];
    _memberId = json['memberId'];
    _memberForId = json['memberForId'];
    _monthNo = json['monthNo'];
    _yearNo = json['yearNo'];
    _isUserAvailable = json['isUserAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filter'] = this._filter;
    data['permission'] = this._permission;
    data['role'] = this._role;
    data['skipCount'] = this._skipCount;
    data['maxResultCount'] = this._maxResultCount;
    data['sorting'] = this._sorting;
    data['fromDate'] = this._fromDate;
    data['toDate'] = this._toDate;
    data['isApproved'] = this._isApproved;
    data['isUnApproved'] = this._isUnApproved;
    if(this._memberId != null){
      data['memberId'] = this._memberId;
    }
    if(this._memberForId != null){
      data['memberForId'] = this._memberForId;
    }
    if(this._monthNo != null){
      data['monthNo'] = this._monthNo;
    }
    if(this._yearNo != null){
      data['yearNo'] = this._yearNo;
    }
    if(this._isUserAvailable != null){
      data['isUserAvailable'] = this._isUserAvailable;
    }
    return data;
  }
}