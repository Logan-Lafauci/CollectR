import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';
import 'appbar_bottom.dart';
import 'feed.dart';


var allCollectibles = <Collectible>[];

void addCollectible(User poster, String name, String description, String imagePath, String tag, {double price = -1.0}){
  Collectible newPost = Collectible(name, description, poster.getUsername, imagePath, tag, price: price);
  allCollectibles.add(newPost);
  poster.addItem(newPost);
}

List<Collectible> filter(String tag){
  var filteredList = <Collectible>[];
  if(tag == 'ALL')
  {
    filteredList = allCollectibles;
  }
  else{
    for(int i = 0; i < allCollectibles.length; i++)
    {
      if(allCollectibles.elementAt(i).getTag == tag)
      {
        filteredList.add(allCollectibles.elementAt(i));
      }
    }
  }
  return filteredList; 
}

//So far the only tags we have are BOOK, MUSIC, FIGURE, ETC. can add more and 

void main() {
  //This is where we will put all of our test examples
  User logan = User("Ignie", "Logan12345", 85);

  User jai = User("Kahlese", "Jai62120", 90);

  User zack = User("Zack", "Zack12345", 69);

  User tom = User("Mot", "Tom36589", 47);
  
  User donald = User("MusicGuy01", "it'smedonald", 95);

  addCollectible(logan, 'Spiderman Torment Part 1',
      'This is the first issue of the Spiderman Torment story line.',
      'assets/SM_Comic.JPEG', "BOOK", price: 30);

  addCollectible(logan, 'Because of The Internet Vinyl',
      'This is a vinyl of Donald Glover\'s second studio album.', 'assets/Childish_Vinyl.JPEG',
      "MUSIC", price: 49.95);

  addCollectible(logan, 'Luffy Gear Four Funko POP',
      'Limited Chalice Collectibles exclusive funko pop. It\'s been taken out of the box but kept in great condition and the box is undamaged.',
       'assets/Luffy_Pop.JPEG', "FIGURE", price: 45);

  addCollectible(zack, 'Mario Amiibo',
      'Super Smash Bros. line of Mario Amiibo. Out of box, great condition.',
      'assets/MarioAmiibo.jpg', "FIGURE");

  addCollectible(zack, 'Too Weird To Live, Too Rare To Die! Vinyl',
      'Too Weird To Live, Too Rare To Die! by Panic! At The Disco.',
      'assets/TooWeird.jpg', "MUSIC");

  addCollectible(zack, 'Scott Pilgrim Vol. 1',
      'Volume 1 of Scott Pilgrim. In Color, Hardcover',
      'assets/ScottPilgrimVol1.jpg', "BOOK", price: 17.49);

  addCollectible(jai, 'Deadpool KeyChain',
      'This is a Deadpool and Unicorn KeyChain.', 'assets/DeadPool_KeyChain.jpg',
      "ETC", price:15);

  addCollectible(jai, 'Among Us Plushie',
      'This is one out of the 8 Among Plushie Collection. In great condition, with a little dust.',
      'assets/AmongUs_Plushie.jpg', "ETC", price: 17.95);

  addCollectible(tom, 'Ms.Marvel Comic Book',
      'Ms.Marvel Comic Book: The Lethal Lizard From Below , It\'s in great condition.',
      'assets/Ms.Marvel_ComicBook.jpg', "BOOK", price: 9.99,);

  addCollectible(tom, 'Inosuke Hanshibira Funko Pop',
      'It has been kept inside the box in great conditon and undamaged', 
      'assets/InosukeHashibira_Pop.jpg', "FIGURE", price: 59.99);
  
  addCollectible(zack, 'Mii Swordfighter Amiibo',
      'Mii Swordfighter Amiibo. Out of box, great condition.',
      'assets/MiiSwordfighterAmiibo.jpg', "FIGURE", price: 47.00);

  addCollectible(donald, 'Igor Vinyl',
      'This is a vinyl of Tyler, the Creator\'s Hit album Igor. Has the tracks like boy is a gun, Earfquake, and more.',
      'assets/Igor_Vinyl.JPEG', "MUSIC", price: 49.95);

  addCollectible(donald, 'Court of the Crimson King Vinyl',
      'This is a vinyl of In the Court of the Crimson King created by the band King Crimson',
      'assets/KC_Vinyl.JPEG', "MUSIC");

  addCollectible(zack, 'Squirtle Amiibo',
      'Squirtle Amiibo. Out of box, great condition.',
      'assets/SquirtleAmiibo.jpg', "FIGURE", price: 15.99);

  addCollectible(logan, 'Chainsawman volume 1-3',
      'This is the first three volumes of chainsaw man. This is a amazing series created by Tatsuki Fujimoto',
      'assets/CM_Manga.jpg', "BOOK");

  runApp(
      const MaterialApp(
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
          padding: const EdgeInsets.only(top: 8.0),
          child: Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[

                TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Feed('ALL')

                        ),
                      );
                    },

                      child: Container(
                        height: 100,
                        color: Colors.amber[700],
                        child: Center(
                          child: Text(
                            'All',
                            style:  TextStyle(

                              fontSize:  30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),

                ),


                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Feed('FIGURE')

                      ),
                    );
                  },
                  child: Container(
                      height: 100,
                      color: Colors.amber[600],
                      child: Center(
                        child: Text(
                          'Figures',
                          style:  TextStyle(

                            fontSize:  30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),

                ),

                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Feed('MUSIC')

                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    color: Colors.amber[500],
                    child: Center(
                      child: Text(
                        'Music',
                        style:  TextStyle(

                          fontSize:  30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),

                ),

                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Feed('BOOK')

                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    color: Colors.amber[400],
                    child: Center(
                      child: Text(
                        'Books',
                        style:  TextStyle(

                          fontSize:  30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),

                ),

                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Feed('ETC')

                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    color: Colors.amber[300],
                    child: Center(
                      child: Text(
                        'Other',
                        style:  TextStyle(

                          fontSize:  30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),

                ),

              ],
            )
          ),
          ),
        color: Colors.black,
      ),

      bottomNavigationBar: const AppBarBot(),

    );
  }
}