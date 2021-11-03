import 'package:flutter/material.dart';
import 'user.dart';
import 'collectible.dart';

void main() {
  User logan = User("Ignie", "Logan12345");
  logan.addItem('Spiderman Torment Part 1',
      'This is the first issue of the Spiderman Torment story line.',
      image: 'assets/SM_Comic.JPEG');

  logan.addItem('Childish Gambino Because of The Internet Vinyl',
      'This is a vinyl of Donald Glover\'s second studio album.',
      price: 49.95, image: 'assets/Childish_Vinyl');
  runApp(
      MaterialApp(
        home: Home(),
      )
  );
}





class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Text(
      //     'CollectR',
      //     style: TextStyle(
      //       fontSize:  20.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.amber[300],
      //       fontFamily: 'Cairo',
      //     ),
      //
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[900],
      //
      // ),




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
            // SliverGrid(
            //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('Grid Item $index'),
            //       );
            //     },
            //     childCount: 20,
            //   ),
            // ),




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
