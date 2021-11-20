
import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';
import 'collect_disp.dart';
import 'appbar_bottom.dart';
import 'search.dart';


var allCollectibles = <Collectible>[];

void addCollectible(User poster, String name, String description, String imagePath, String tag, {double price = -1.0}){
  print("Hey");
  Collectible newPost = Collectible(name, description, poster.getUsername, imagePath, tag, price: price);
  allCollectibles.add(newPost);
  poster.addItem(newPost);
}

List<Collectible> filter(String tag){
  var filteredList = <Collectible>[];
  for(int i = 0; i < allCollectibles.length; i++)
  {
    if(allCollectibles.elementAt(i).getTag == tag)
    {
      filteredList.add(allCollectibles.elementAt(i));
    }
  }
  return filteredList; 
}

/*So far the only tags we have are BOOK, MUSIC, FIGURE, ETC. can add more and 
* will probably mess around with it
*/

void main() {
  User logan = User("Ignie", "Logan12345", 85);
  addCollectible(logan, 'Spiderman Torment Part 1',
      'This is the first issue of the Spiderman Torment story line.',
      'assets/SM_Comic.JPEG', "BOOK");

  addCollectible(logan, 'Childish Gambino Because of The Internet Vinyl',
      'This is a vinyl of Donald Glover\'s second studio album.', 'assets/Childish_Vinyl.JPEG',
      "MUSIC", price: 49.95);

  addCollectible(logan, 'Luffy Gear Four Funko POP',
      'Limited Chalice Collectibles exclusive funko pop. It\'s been taken out of the box but kept in great condition and the box is undamaged.',
       'assets/Luffy_Pop.JPEG', "FIGURE", price: 45);

  User jai = User("Kahlese", "Jai62120", 90);
  addCollectible(jai, 'Deadpool and Unicorn KeyChain',
      'This is a Deadpool and Unicorn KeyChain.', 'assets/Deadpool_Keychain.jpg',
      "ETC", price:15);

  addCollectible(jai, 'Amoung Us Plushie',
      'This is one out of the 8 Amoung Plushie Collection. In great condition, with a little dust.',
      'assets/AmongUs_Plushie.jpg', "ETC", price: 17.95);

  User tom = User("Mot", "Tom36589", 47);
  addCollectible(tom, 'Ms.Marvel Comic Book',
      'Ms.Marvel Comic Book: The Lethal Lizard From Below , It\'s in great condition.',
      'assets/Ms.Marvel_ComicBook.jpg', "BOOK", price: 9.99,);

  addCollectible(tom, 'Inosuke Hanshibira Funko Pop',
      'It has been kept inside the box in great conditon and undamaged', 
      'assets/InosukeHashibira_Pop.jpg', "FIGURE", price: 59.99);

  User donald = User("MusicGuy01", "it'smedonald", 95);
  addCollectible(donald, 'Igor Vinyl',
      'This is a vinyl of Tyler, the Creator\'s Hit album Igor. Has the tracks like boy is a gun, Earfquake, and more.',
      'assets/Igor_Vinyl.JPEG', "MUSIC", price: 49.95);

  addCollectible(donald, 'In the Court of the Crimson King Vinyl',
      'This is a vinyl of In the Court of the Crimson King created by the band King Crimson',
      'assets/KC_Vinyl.JPEG', "MUSIC", price: 49.95);

  addCollectible(logan, 'Chainsawman volume 1-3',
      'This is the first three volumes of chainsaw man. This is a amazing series created by Tatsuki Fujimoto',
      'assets/CM_Manga.jpg', "BOOK");

  allCollectibles = filter("BOOK");
  /*This is for testing filter and it works!!
  * when using it we should create a screen full of the tags we can select from
  * then we create a new list instead of reassigning all collectibles
  * Collect Disp will have to take in another argument which is this new filtered list
  * If you want to mess with it change the parameter to another tag
  * for all collectibles don't run the filter method.
  * If you have more questions ask me.
  */

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
                                  builder: (context) => CollectDisp(index)

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








      bottomNavigationBar: AppBarBot(),







    );
  }
}

