
import 'package:flutter/material.dart';


 class MyHeaderDrawer extends StatefulWidget{
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
  
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context){
    return Container(
      color:Color.fromARGB(255, 251, 75, 137),
      width:double.infinity,
      height:200,
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:EdgeInsets.only(bottom:10),
            height:40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
             image:DecorationImage(
               image:AssetImage('assets/images/fc.jpg') ,
              
                )
              ),
          ),
          Text("FC",style: TextStyle(color: Colors.white, fontSize: 20),),
          Text("fergusson.edu",style: TextStyle(color: Colors.grey[200], fontSize: 14),)
        ],
      ),
    );
  }
  
}