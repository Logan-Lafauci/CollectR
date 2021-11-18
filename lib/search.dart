
import 'package:flutter/material.dart';






class DataSearch extends SearchDelegate<String?> {


  final recentSearches = [
    "Lego AT-TE",
    "Saul Goodman Funko Pop",
    "Vintage CD",
    "Spiderman Torment Part 1",
  ];

  final testCollectibles = [
    "Lego AT-TE",
    "Saul Goodman Funko Pop",
    "Vintage CD",
    "Fortnite Chungus",
    "Spiderman Torment Part 1",
    "Luffy Gear Four Funko POP",
    "Childish Gambino Because of The Internet Vinyl",
    "Five Nights at Freddys Plushy",
    "Scooby Doo Bobblehead",
    "Babe Ruth Baseball Card",
    "Jack Winstead Stop Sign",
    "Funko Pop",
    "Vinyl",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  String? fix = null;

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List suggestionList = query.isEmpty ? recentSearches : testCollectibles.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.location_city),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey))
          ],
        ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}






