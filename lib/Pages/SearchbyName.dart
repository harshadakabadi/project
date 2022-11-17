import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/api/api_service.dart';
import 'package:project/model/model_insert.dart';


class SearchbyNamePage extends StatefulWidget {
  _SearchbyNamePageState createState() => _SearchbyNamePageState();
}
class _SearchbyNamePageState extends State<SearchbyNamePage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  late InsertRequestModel insertRequestModel;
   @override
  void initState() {
    super.initState();
    insertRequestModel = new InsertRequestModel();
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
   
    return false;
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

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
                        Text(
                          "Search  By  Name",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => insertRequestModel.uid= input.toString(),

                          decoration: new InputDecoration(
                            hintText: "Enter Name Of plant",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            
                          ),
                        ),
                        
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(insertRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(insertRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.token.isNotEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text("Submitted Successfully"));
                                    ScaffoldKey.currentState;
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.error));
                                    ScaffoldKey.currentState;

                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
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
