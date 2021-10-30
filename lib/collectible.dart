class Collectible {
  String _name;
  String _description;
  double _price = -1; //If price is negative the item is not for sale
  String _imagePath = "";
  //To display image use Image.asset() with this variable as the parameter

  Collectible(this._name, this._description, {price = -1, imagePath = ""}) {
    _price = price;
    _imagePath = imagePath;
  }

// The symbol => means that the value it's pointing to is getting returned

  String get name => _name;

  String get description => _description;

  double get price => _price;

  String get imagePath => _imagePath;

  set name(String _name) {
    this._name = _name;
  }

  set description(String _description) {
    this._description = _name;
  }

  set price(double _price) {
    this._price = _price;
  }

  set imagePath(String _imagePath) {
    this._imagePath = _imagePath;
  }
}
