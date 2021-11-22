import 'package:flutter/material.dart';
import 'main.dart';

import 'collect_disp.dart';
import 'appbar_bottom.dart';
import 'collectible.dart';

class Feed extends StatefulWidget {
  String tag;
  Feed(this.tag, {Key? key}) : super(key: key);


  @override
  _FeedState createState() => _FeedState(tag);
}
var filteredList;

class _FeedState extends State<Feed> {
  late String tag;
  _FeedState(this.tag){
    filteredList = filter(tag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],


      ),
      body:
      Container(
        child: ListView.builder(
          itemCount: filteredList.length,
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
                        Container(
                          child: Image.asset(filteredList.elementAt(index).getImagePath, fit: BoxFit.fitWidth,),


                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, ),
                              child: Text((() {
                                if(filteredList.elementAt(index).getPrice == -1){
                                  return '';}

                                return '\$'+filteredList.elementAt(index).getPrice.toString();}
                              )(),
                                style: TextStyle(
                                  fontSize:  24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[300],
                                  fontFamily: 'Cairo',
                                ),
                              ),

                            ),
                            Spacer(),

                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text(
                                filteredList.elementAt(index).getName+' - '+filteredList.elementAt(index).getOwner,
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



                      ],
                    ),
                  ),



                ),
              ),
            );
          },
        ),
        color: Colors.black,
      ),


      bottomNavigationBar: const AppBarBot(),
    );


  }
}
