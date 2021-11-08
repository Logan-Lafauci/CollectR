import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';

void main() {
  var allCollectibles = <Collectible>[];

  void addCollectible(User poster, String name, String description, {double price = -1, String image = ""})
  {
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
    price: 49.95, image: 'assets/Childish_Vinyl');

  addCollectible(logan, 'Luffy Gear Four Funko POP',
    'Limited Chalice Collectibles exclusive funko pop. It\'s been taken out of the box but kept in great condition and the box is undamaged.', 
    price: 45, image:'assets/Luffy_Pop.JPEG');

  runApp(
      MaterialApp(
        home: Home(),
      )
  );
}


class CollectDisp extends StatelessWidget {
  const CollectDisp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back), onPressed: () {},
                  color: Colors.amber[400],
                ),
                Text(
                  'Luffy Gear Four Funko POP',
                  style: TextStyle(
                    fontSize:  20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[300],
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.grey[850],
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
                                'Luffy Gear Four Funko POP',
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
                                    'Ignie',
                                    style: TextStyle(
                                      fontSize:  13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber[300],
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$45.00',
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
                          child: Image.asset('assets/Luffy_Pop.JPEG'),
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
                                'Limited Chalice Collectibles exclusive funko pop. It\'s been taken out of the box but kept in great condition and the box is undamaged.',
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
                      ],
                    ),
                    color: Colors.grey[850],
                  )
              ),
            ),
            color: Colors.black,
          )
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





      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(bottom: 8.0),
              sliver: SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'CollectR',
                    style: TextStyle(
                      fontSize:  20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[400],
                      fontFamily: 'Cairo',
                    ),
                  ),
                  centerTitle: true,
                ),
                backgroundColor: Colors.grey[900],
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100.0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.grey[800],
                          child: Text(
                            'List Item $index',
                            style: TextStyle(
                              fontSize:  20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[400],
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                  );
                },
              ),
            )
          ],
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







    );
  }
}
