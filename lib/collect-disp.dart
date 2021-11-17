import 'package:flutter/material.dart';

import 'main.dart';

class CollectDisp extends StatelessWidget {
  const CollectDisp({Key? key}) : super(key: key);

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
    );;
  }
}




