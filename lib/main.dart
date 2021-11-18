
import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';
import 'collect_disp.dart';
import 'appbar_bottom.dart';
import 'search.dart';


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

  User jai = User("Kahlese", "Jai62120");
  addCollectible(jai, 'Deadpool and Unicorn KeyChain',
      'This is a Deadpool and Unicorn KeyChain.',
      price:15, image:'assets/Deadpool_Keychain.jpg');

  addCollectible(jai, 'Amoung Us Plushie',
      'This is one out of the 8 Amoung Plushie Collection. In great condition, with a little dust.',
      price: 17.95, image: 'assets/AmongUs_Plushie.jpg');

  User tom = User("Mot", "Tom36589");
  addCollectible(tom, 'Ms.Marvel Comic Book',
      'Ms.Marvel Comic Book: The Lethal Lizard From Below , It\'s in great condition.',
      price: 9.99, image: 'assets/Ms.Marvel_ComicBook.jpg');

  addCollectible(tom, 'Inosuke Hanshibira Funko Pop',
      'It has been kept inside the box in great conditon and undamaged',
      price: 59.99, image: 'assets/InosukeHashibira_Pop.jpg');

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

