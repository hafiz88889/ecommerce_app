class Result<T> {
  int? _totalCount;
  List<T>? _itemList;

  Result({int? totalCount, List<T>? itemList}) {
    if (totalCount != null) {
      this._totalCount = totalCount;
    }
    if (itemList != null) {
      this._itemList = itemList;
    }
  }

  int? get totalCount => _totalCount;
  set totalCount(int? totalCount) => _totalCount = totalCount;
  List<T>? get itemList => _itemList;
  set itemList(List<T>? itemList) => _itemList = itemList;

  // Convert a Result object into a Map
  Map<String, dynamic> toJson(Map<String,dynamic> Function(T value) toJsonT) {
    return {
      'totalCount': totalCount,
      'items': itemList?.map((item) => toJsonT(item)).toList(),
    };
  }

  // Create a Result object from a Map
  factory Result.fromJson(Map<String, dynamic> json, T Function(Map<String,dynamic> json) fromJsonT) {
    var list = json['items'] as List;
    List<T> itemsList = list.map((item) => fromJsonT(item)).toList();

    return Result<T>(
      totalCount: json['totalCount'],
      itemList: itemsList,
    );
  }
}
