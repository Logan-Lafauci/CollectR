import 'package:collectr/collectible.dart';
import 'collectible.dart';

class User {
  String _username;
  String _password;
  var collectibleList = <Collectible>[];

  User(this._username, this._password);

  String get username {
    return _username;
  }

  String get password {
    return _password;
  }

  List<Collectible> get listOfCollectibles {
    return collectibleList;
  }

  set username(String _username) {
    this._username = _username;
  }

  set password(String _password) {
    this._password = _password;
  }

  void addItem(String name, String description,
      {double price = -1, String image = ""}) {
    collectibleList
        .add(Collectible(name, description, price: price, imagePath: image));
  }
}
