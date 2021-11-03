class Collectible {
  String _name;
  String _description;
  double _price = -1; //If price is negative the item is not for sale
  String _imagePath = "";
  String _owner;
  //To display image use Image.asset() with this variable as the parameter

  Collectible(this._name, this._description, this._owner, {price = -1, imagePath = ""}) {
    _price = price;
    _imagePath = imagePath;
  }

// The symbol => means that the value it's pointing to is getting returned

  String get getName => _name;

  String get getDescription => _description;

  double get getPrice => _price;

  String get getImagePath => _imagePath;

  String get getOwner => _owner;

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
}
