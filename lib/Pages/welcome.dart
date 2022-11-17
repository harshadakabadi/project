import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Welcome extends StatefulWidget {
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

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
                                    padding: EdgeInsets.only(left: 100,top: 50),
                                      
                                      child: Text(
                                        'Welcome To Botanical Garden            Module',
                                        style: Theme.of(context).textTheme.headline1,
                                        ),
                                        ),
                                        Padding(
                                    padding: EdgeInsets.only(top:15),
                                      
                                      child: Text(
                                        '\nList of Diversity',
                                        style: Theme.of(context).textTheme.headline2,
                                        textAlign: TextAlign.left,
                                        ),
                                        ),
                                        Padding(
                                    padding: EdgeInsets.only(top:15),
                                      
                                      child: Text(
                                        '\n   Number of Species :-',
                                        style: Theme.of(context).textTheme.headline2,
                                        textAlign: TextAlign.justify,
                                        ),
                                        ),
                                        Padding(
                                    padding: EdgeInsets.only(top:15),
                                      
                                      child: Text(
                                        '\nNumber of Plants :-',
                                       style: Theme.of(context).textTheme.headline2,
                                        textAlign: TextAlign.right,
                                        ),
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
