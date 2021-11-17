
import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';
import 'collect-disp.dart';
import 'add.dart';

var allCollectibles = <Collectible>[];

void addCollectible(User poster, String name, String description, {double price = -1.0, String image = ""}){
  print("Hey");
  Collectible newPost = Collectible(name, description, poster.getUsername, price: price, imagePath: image);
  allCollectibles.add(newPost);
  poster.addItem(newPost);
}

void main() {
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
        debugShowCheckedModeBanner: false,
      )
  );
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
              icon: Icon(Icons.add), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Container(
                        child: Scaffold(

                          body: Add(),                      //this is your container logan

                          bottomNavigationBar: BottomAppBar(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.home), onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home(


                                        )

                                    ),
                                  );
                                },
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
                                  icon: Icon(Icons.add), onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Container(


                                        )

                                    ),
                                  );
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
                        )

                      )

                  ),
                );
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
