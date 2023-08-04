import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:parkatmdu/main.dart';

class park1 extends StatefulWidget {
  const park1({super.key});

  @override
  State<park1> createState() => _park1State();
}

class _park1State extends State<park1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title:Text("A Park"),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)
          
          )
        
        
        
      ],
        ),
        ),
    
      );
      
      
  }
}