import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class getName extends StatefulWidget {
  _getNameState createState() => _getNameState();
}
class _getNameState extends State<getName> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),

      key: ScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                       
                      Padding(  
                        padding: EdgeInsets.fromLTRB(2,15,2,15),  
                        child: Text('Name of Plant :',
                                    style: Theme.of(context).textTheme.headline1,
                        )
                      ),  
                                    
                        SizedBox(
                          height: 20,
                        ),
                        
                       
                       
                      ],
                    ),
                      
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
