import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class App extends StatefulWidget{
  @override
  createState() {
    return Home();
  }
}

class Home extends State<App>{
  
  String type = '', setup = '', punchline = '';

  Future getData() async{

    http.Response response = await http.get(
      Uri.encodeFull('https://official-joke-api.appspot.com/random_joke'),
      headers: {
        "Accept" : "application/json"
      }
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    //print(response.body);
    //data = json.decode(response.body) ;
    /*print('Type: ${data['type']}');
    print('Setup: ${data['setup']}');
    print('Punchline: ${data['punchline']}'); */
    setState(() {
          type = data['type'];
          setup = data['setup'];
          punchline = data['punchline'];
    });


    print(type);
    print(setup);
    print(punchline);
  }

    Widget build(context){
      return MaterialApp(
        home: Scaffold(

          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.refresh,
              color: Color(0xFF4542f4),
              ),
              backgroundColor: Color(0xFFffffff),
              onPressed: () {
                getData();
              },
          ),


          appBar: AppBar(
            title: Text('Jokes'),
          ),

          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Text('Type: ', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 20.0),),
              new Text('$type', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 16.0),),
              new Text('Setup: ', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 20.0),),
              new Text('$setup', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 16.0),),
              new Text('Punchline: ', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 20.0),),
              new Text('$punchline', textAlign: TextAlign.center, style: new TextStyle(fontFamily: "Roboto", fontSize: 16.0),),
            ],
          ),

          ),
          
            );
    }
}