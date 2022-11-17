

import 'package:flutter/material.dart';
import 'package:project/Pages/Insert_page.dart';
import 'package:project/Pages/NavBar.dart';
import 'package:project/Pages/SearchbyName.dart';
import 'package:project/Pages/getName.dart';
import 'package:project/Pages/welcome.dart';
import 'package:project/widget/button_widget.dart';
import 'package:project/Pages/SerchbyID.dart';
import 'package:project/Nav_drawer/my_drawer_header.dart';


void main() {
  runApp(const MyApp());
  home:MainPage();
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FC App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      
      home:MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage;
  
  @override
  Widget build(BuildContext context) {
    if (currentPage == DrawerSections.home) {
        Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => InsertPage()));
    } else if (currentPage == DrawerSections.welcome) {
      Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  Welcome()),);
    } else if (currentPage == DrawerSections.history) {
     Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainPage()),);
    } else if (currentPage == DrawerSections.SearchbyIDPage) {
       Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchbyIDPage()),);
    } else if (currentPage == DrawerSections.SearchbyName) {
     Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchbyIDPage()),);
    } else if (currentPage == DrawerSections.InsertPage) {
      Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InsertPage()),);
    } 
       return Scaffold(
       appBar: AppBar(
          backgroundColor:Color.fromARGB(255, 251, 75, 137),
          title: Text("Fergusson College Smart Application"),
        ),
        body:Container(
          child:
          Container( 
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/images/fc.jpg') ,
                //fit: BoxFit.fill,
                  ),
            ),
           // Center(
           // child:Text("Botanical Garden"),
         // ),
          )
       ),
       drawer: Drawer(
        child: SingleChildScrollView(
          child:Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          )
        ),
       ), 
       );
        
        
}
Widget MyDrawerList(){
  return Container(
    padding: EdgeInsets.only(
      top: 10,
      ),
    child: Column(
      children: [
        menuItem("Home",1,Icons.home,
        currentPage = DrawerSections.home ),
        Divider(),
        menuItem("Botanical garden Module",2,Icons.favorite_border,
        currentPage = DrawerSections.welcome),
        menuItem("History",3,Icons.history,
        currentPage = DrawerSections.history),
        Divider(),
        menuItem("Search By ID",4,Icons.search,
        currentPage = DrawerSections.SearchbyIDPage),
        menuItem("Search By Name",5,Icons.search,
        currentPage = DrawerSections.SearchbyName),
        menuItem("Insert Data",6,Icons.insert_chart,
        currentPage = DrawerSections.InsertPage),
      ],
    ),
  );
}
Widget menuItem(String title, int id ,  IconData icon, bool ){
  return Material(
    color:    Colors.grey[300],// : Colors.transparent,
    child: InkWell(
      onTap: (){
        Navigator.pop(context);
        setState(() {
          if(id == 1){
            currentPage = DrawerSections.home;
          }else if(id==2){
            currentPage = DrawerSections.welcome;
          }else if(id==3){
            currentPage = DrawerSections.history;
          }else if(id==4){
            currentPage = DrawerSections.SearchbyIDPage;
          }else if(id==5){
            currentPage = DrawerSections.SearchbyName;
          }else if(id==6){
            currentPage = DrawerSections.InsertPage;
          }
        });
      },
      child: Padding(
        padding:EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child:Icon(
                   icon,
                   size:20,
                   color:Colors.black,  
            ),
            ),
            Expanded(child: Text(title,style: TextStyle(color: Colors.black,fontSize: 16,),),),
          ],
        ), 
        ),

    ),
  );
}

}
enum DrawerSections{
  home,
  welcome,
  history,
  SearchbyIDPage,
  SearchbyName,
  InsertPage,
  
}






