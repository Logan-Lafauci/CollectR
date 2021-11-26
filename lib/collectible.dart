class Collectible {
  String _name;
  String _description;
  double _price = -1; //If price is negative the item is not for sale
  int _detail = 0;//if detail is zero display nothing
  String _imagePath;
  String _owner;
  String _tag;
  var commentList = <String>[];

  Collectible(this._name, this._description, this._owner, this._imagePath, this._tag, {price = -1, detail = 0}) {
    _price = price;
    _detail = detail;
  }

  String get getName => _name;

  String get getDescription => _description;

  double get getPrice => _price;

  String get getImagePath => _imagePath;

  String get getOwner => _owner;

  String get getTag => _tag;

  int get getDetail => _detail;

  set setName(String _name) {
    this._name = _name;
  }

  set setDescription(String _description) {
    this._description = _name;
  }

  set setPrice(double _price) {
    this._price = _price;
  }

  set setImagePath(String _imagePath) {
    this._imagePath = _imagePath;
  }

  set setOwner(String _owner) {
    this._owner = _owner;
  }

  set setTag(String _tag) {
    this._tag = _tag;
  }

  void addComment(String comment){
    commentList.add(comment);
  }

  set setDetail(int _detail) {
    this._detail = _detail;
  }
}
