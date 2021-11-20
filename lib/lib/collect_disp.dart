import 'package:flutter/material.dart';
import 'appbar_bottom.dart';
import 'main.dart';

class CollectDisp extends StatelessWidget {
  final int index;

  const CollectDisp(this.index, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(


        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          // title: Center(
          //   child: Text((() {
          //     if(allCollectibles.elementAt(index).getPrice == -1){
          //       return '';}
          //
          //     return '\$'+allCollectibles.elementAt(index).getPrice.toString();}
          //   )(),
          //     style: TextStyle(
          //       fontSize:  20.0,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.amber[300],
          //       fontFamily: 'Cairo',
          //     ),
          //   ),
          // ),

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
                          Container(

                            child: Image.asset(
                              allCollectibles.elementAt(index).getImagePath,
                              fit: BoxFit.fitWidth,
                            ),

                          ),

                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 10.0),
                          //   child: Text((() {
                          //     if(allCollectibles.elementAt(index).getPrice == -1){
                          //       return 'Not For Sale';}
                          //
                          //     return '\$'+allCollectibles.elementAt(index).getPrice.toString();}
                          //   )(),
                          //     style: TextStyle(
                          //       fontSize:  18.0,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.amber[300],
                          //       fontFamily: 'Cairo',
                          //     ),
                          //   ),
                          //
                          //
                          // ),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0, ),
                                  child: Text((() {
                                    if(allCollectibles.elementAt(index).getPrice == -1){
                                      return '';}

                                    return '\$'+allCollectibles.elementAt(index).getPrice.toString();}
                                  )(),
                                    style: TextStyle(
                                      fontSize:  26.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber[300],
                                      fontFamily: 'Cairo',
                                    ),
                                  ),

                                ),
                                Spacer(),

                                Padding(
                                  padding: EdgeInsets.only(right: 30.0),
                                  child: Text(
                                    allCollectibles.elementAt(index).getName+' - '+allCollectibles.elementAt(index).getOwner,
                                    style:  TextStyle(

                                      fontSize:  17.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[200],
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              allCollectibles.elementAt(index).getDescription,
                              style: TextStyle(
                                fontSize:  17.0,

                                color: Colors.grey[200],
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
                          child: Center(
                            child: Text(
                              'Purchase',
                              style: TextStyle(
                                fontSize:  15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900],
                                fontFamily: 'Cairo',
                              ),
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
        bottomNavigationBar: const AppBarBot(),

      ),
      color: Colors.grey[850],
    );;
  }
}




