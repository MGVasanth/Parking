import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:parkatmdu/main.dart';

class park2 extends StatefulWidget {
  const park2({super.key});

  @override
  State<park2> createState() => _park2State();
}

class _park2State extends State<park2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title:Text("B Park"),
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