import 'package:flutter/material.dart';
import 'main.dart';

import 'collect_disp.dart';
import 'appbar_bottom.dart';

// ignore: must_be_immutable
class Feed extends StatefulWidget {
  String tag;
  Feed(this.tag, {Key? key}) : super(key: key);


  @override
  // ignore: no_logic_in_create_state
  _FeedState createState() => _FeedState(tag);
}
// ignore: prefer_typing_uninitialized_variables
var filteredList;

class _FeedState extends State<Feed> {
  late String tag;
  _FeedState(this.tag){
    filterTag = tag;
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                      Image.asset(filteredList.elementAt(index).getImagePath, fit: BoxFit.fitWidth,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, ),
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
                          const Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
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
            );
          },
        ),
        color: Colors.black,
      ),


      bottomNavigationBar: const AppBarBot(),
    );


  }
}
