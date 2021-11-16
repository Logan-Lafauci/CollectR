import 'dart:ffi';
import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';

var allCollectibles = <Collectible>[];

void main() {
  // var allCollectibles = <Collectible>[];
  void addCollectible(User poster, String name, String description, {double price = -1.0, String image = ""})
  {
    print("Hey");
    Collectible newPost = Collectible(name, description, poster.getUsername, price: price, imagePath: image);
    allCollectibles.add(newPost);
    poster.addItem(newPost);
  }

  User logan = User("Ignie", "Logan12345");
  addCollectible(logan, 'Spiderman Torment Part 1',
      'This is the first issue of the Spiderman Torment story line.',
      image: 'assets/SM_Comic.JPEG');

  addCollectible(logan, 'Childish Gambino Because of The Internet Vinyl',
      'This is a vinyl of Donald Glover\'s second studio album.',
      price: 49.95, image: 'assets/Childish_Vinyl.JPEG');

  addCollectible(logan, 'Luffy Gear Four Funko POP',
      'Limited Chalice Collectibles exclusive funko pop. It\'s been taken out of the box but kept in great condition and the box is undamaged.',
      price: 45, image:'assets/Luffy_Pop.JPEG');

  runApp(
      MaterialApp(
        home: Home(),
      )
  );
}




class CollectDisp extends StatefulWidget {

  const CollectDisp({Key? key}) : super(key: key);

  @override
  _CollectDispState createState() => _CollectDispState();
}

class _CollectDispState extends State<CollectDisp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'CollectR',
              style: TextStyle(
                fontSize:  20.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber[300],
                fontFamily: 'Cairo',
              ),
            ),
          ),
          backgroundColor: Colors.grey[900],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(
              top:    15.0,
              bottom: 15.0,
            ),
            child: Center(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              allCollectibles.elementAt(1).getName,
                              style: TextStyle(
                                fontSize:  20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[300],
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Spacer(),
                                Spacer(),
                                Text(
                                  allCollectibles.elementAt(1).getOwner,
                                  style: TextStyle(
                                    fontSize:  13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber[300],
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                Spacer(),
                                Text((() {
                                  if(allCollectibles.elementAt(2).getPrice == -1){
                                    return '';}

                                  return '\$'+allCollectibles.elementAt(2).getPrice.toString();}
                                )(),
                                  style: TextStyle(
                                    fontSize:  13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber[300],
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        child: Image.asset(allCollectibles.elementAt(1).getImagePath),
                        height: 350,
                        width: 350,
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              allCollectibles.elementAt(1).getDescription,
                              style: TextStyle(
                                fontSize:  15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[300],
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          color: Colors.grey[900],
                        ),
                      ),

                      Container(

                        child: TextButton(
                          onPressed: (){},
                          child: Text(
                            'Amogus',
                            style: TextStyle(
                              fontSize:  15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        color: Colors.amber[300],

                      ),






                    ],
                  ),
                  color: Colors.grey[850],
                )
            ),
          ),
          color: Colors.black,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home), onPressed: () {},
                color: Colors.amber[400],
              ),

              Spacer(),
              IconButton(
                icon: Icon(Icons.search), onPressed: () {},
                color: Colors.amber[400],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.person_rounded), onPressed: () {},
                color: Colors.amber[400],
              ),

            ],
          ),
          color: Colors.grey[900],
        ),

      ),
      color: Colors.grey[850],
    );
  }
}







class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Center(
          child: Text(
            'CollectR',
            style: TextStyle(
              fontSize:  20.0,
              fontWeight: FontWeight.bold,
              color: Colors.amber[400],
              fontFamily: 'Cairo',
            ),
          ),
        ),

        backgroundColor: Colors.grey[900],
      ),



      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),

          child: Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: allCollectibles.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey[800],
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CollectDisp()

                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                allCollectibles.elementAt(index).getName,
                                style: TextStyle(
                                  fontSize:  15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[400],
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              Container(
                                child: Image.asset(allCollectibles.elementAt(index).getImagePath),
                                height: 350,
                                width: 350,
                              ),


                            ],
                          ),
                        ),



                      ),
                    ),
                  );
                },
              ),
            ),






          ),

        ),
        color: Colors.black,
      ),








      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home), onPressed: () {},
              color: Colors.amber[400],
            ),


            Spacer(),
            IconButton(
              icon: Icon(Icons.search), onPressed: () {
                showSearch(context: context, delegate: DataSearch());
            },
              color: Colors.amber[400],
            ),


            Spacer(),
            IconButton(
              icon: Icon(Icons.person_rounded), onPressed: () {},
              color: Colors.amber[400],
            ),

          ],
        ),
        color: Colors.grey[900],
      ),







    );
  }
}



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
