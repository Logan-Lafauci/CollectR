import 'package:collectr/collectible.dart';
import 'collectible.dart';

class User {
  String _username;
  String _password;
  int _rating = 0;
  var collectibleList = <Collectible>[];

  User(this._username, this._password, this._rating);

  String get getUsername =>  _username;

  String get getPassword => _password;

  int get getRating => _rating;

  List<Collectible> get getListOfCollectibles => collectibleList;

  set setUsername(String _username) {
    this._username = _username;
  }

  set setPassword(String _password) {
    this._password = _password;
  }

  set setRating(int _rating) {
    this._rating = _rating;
  }

  void addItem(Collectible newPost) {
    collectibleList.add(newPost);
  }
}
