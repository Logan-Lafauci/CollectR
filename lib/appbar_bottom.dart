import 'main.dart';
import'package:flutter/material.dart';
import 'add.dart';
import 'search.dart';

class AppBarBot extends StatefulWidget {
  const AppBarBot({Key? key}) : super(key: key);

  @override
  _AppBarBotState createState() => _AppBarBotState();
}

class _AppBarBotState extends State<AppBarBot> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Home()

                ),
              );
            },
            color: Colors.amber[400],
          ),


          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
            color: Colors.amber[400],
          ),

          const Spacer(),

          IconButton(
            icon: const Icon(Icons.add), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Add()

              ),
            );
          },
            color: Colors.amber[400],
          ),

          const Spacer(),
          IconButton(
            icon: const Icon(Icons.person_rounded), onPressed: () {},
            color: Colors.amber[400],
          ),

        ],
      ),
      color: Colors.grey[900],
    );
  }
}
