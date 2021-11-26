import 'package:collectr/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'user.dart';
import 'appbar_bottom.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddScreenState();
  }
}

class AddScreenState extends State<Add> {
  User owner = User("tester", "password", 99);
  String _name = "";
  String _description = "";
  double _price = -1.0;
  int _detail = 0;
  String _imagePath = "";
  String _tag = filterTag;
  
  String detailText(_tag)
  {
    print(_tag);
    if(_tag == 'MUSIC'){
      return 'Number of songs (Optional)';
    }
    else if(_tag == 'BOOK'){
      return 'Number of Pages (Optional)';
    }
    else if(_tag == 'ETC' || _tag == 'FIGURE'){
      return 'Size of item in inches (Optional)';
    }
    return 'Detailed number related to tag (Optional)';
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      maxLength: 50,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildDescription(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      maxLength: 500,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Description is Required';
        }

        return null;
      },
      onSaved: (value) {
        _description = value!;
      },
    );
  }

  Widget _buildTag(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Tag',
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      maxLength: 8,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tag is Required';
        }

        return null;
      },
      onSaved: (value) {
        _tag = value!;
      },
    );
  }

  Widget _buildPrice(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Price (Optional)',
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      keyboardType:const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
      ],
      maxLength: 10,
      onSaved: (value) {
        if (value == null || value.isEmpty) {
          _price = -1.0;
        }
        else
        {
          _price = double.parse(value);
        }
      },
    );
  }

   Widget _buildDetail(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: detailText(_tag),
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      maxLength: 10,
      onSaved: (value) {
        if (value == null || value.isEmpty) {
          _detail = 0;
        }
        else
        {
          _detail = int.parse(value);
        }
      },
    );
  }

  Widget _buildImagePath(){
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Image name',
        labelStyle: TextStyle(
          fontSize:  16.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber[300],
          fontFamily: 'Cairo',
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Image name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _imagePath = "assets/" + value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(
            'CollectR',
            style: TextStyle(
              fontSize:  20.0,
              fontWeight: FontWeight.bold,
              color: Colors.amber[300],
              fontFamily: 'Cairo',
            ),
          ),
          backgroundColor: Colors.grey[900],
        ),

        body: Padding(
          padding: const EdgeInsets.only(
            top:    15.0,
            bottom: 15.0,
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildName(),
                      _buildDescription(),
                      if(filterTag == 'ALL') _buildTag(),
                      _buildPrice(),
                      _buildDetail(),
                      _buildImagePath(),
                      const SizedBox(height: 100),

                      Container(
                        child: TextButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize:  16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900],
                              fontFamily: 'Cairo',
                            ),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            _formKey.currentState!.save();

                            addCollectible(owner, _name, _description, _imagePath, _tag, price: _price);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()

                              ),
                            );
                          },

                        ),
                        color: Colors.amber[300],
                      ),


                    ],
                  ),
                ),

              ),

            ),
            color: Colors.grey[850],
          ),
        ),


        bottomNavigationBar:  AppBarBot(),
        backgroundColor: Colors.black,
      );

  }
}