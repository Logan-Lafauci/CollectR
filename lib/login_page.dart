import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(MaterialApp(
  home: test()
));


class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordInput = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title:const Text('User Login')
      ),
     body:Column(
       children: [
         Expanded(
           child:Image.asset('assets/logo_image.jpg')
         ),
         const Padding(
           padding: EdgeInsets.all(12.0),
           child: TextField(
             decoration: InputDecoration(
               hintText: 'Enter Username',
               labelStyle: TextStyle(
                 fontSize: 36,
                 color:Colors.black87
               ),
               border:OutlineInputBorder()
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: TextField(
             controller: _passwordInput,
             decoration: const InputDecoration(
                 hintText: 'Enter Password',
                 labelStyle: TextStyle(
                     fontSize: 36,
                     color:Colors.black87
                 ),
                 border:OutlineInputBorder(),
             ),
             obscureText: true,
           ),
         ),
         ElevatedButton(
             onPressed: (){
               if(_passwordInput.text=='password'){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Home()),
                 );
               }
               else{
                 print('Incorrect username/password');
               }
             },
             child: const Text('Submit'))
       ],
     ),
    );
  }
}
