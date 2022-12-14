import 'package:flutter/material.dart';
import 'package:project/navbar_pages/favourites_page.dart';
import 'package:project/navbar_pages/people_page.dart';
import 'package:project/navbar_pages/user_page.dart';
import 'package:project/main.dart';
import 'package:project/Pages/Insert_page.dart';
import 'package:project/Pages/welcome.dart';
import 'package:project/Pages/SerchbyID.dart';
import 'package:project/Pages/SearchbyName.dart';




class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'FC';
    final email = 'fergusson.edu';
    final urlImage =
        'https://www.google.com/search?q=fergusson+college&rlz=1C1VDKB_enIN1020IN1020&sxsrf=ALiCzsYhRIGN2jXReuhERSmFEYYPXYwWTg:1663261429745&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiQ4sDVo5f6AhUqGKYKHS-dCxUQ_AUoAXoECAMQAw&biw=1536&bih=754&dpr=1.25#imgrc=0qkhyM7-v1mDxM';

    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 251, 75, 137),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'FC',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
              },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Botanical Garden Module',
                    icon: Icons.favorite_border,
                    onClicked: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Welcome()));
              },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'History',
                    icon: Icons.history,
                    onClicked: () {
                   // Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
              },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Search by Name',
                    icon: Icons.search,
                    onClicked: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchbyNamePage()));
              },
                  ),
                 // const SizedBox(height: 24),
                 // Divider(color: Colors.white70),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Search by ID',
                    icon: Icons.search,
                    onClicked: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchbyIDPage()));
              },
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Insert Details',
                    icon: Icons.insert_chart,
                    onClicked: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>InsertPage ()));
              },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
    }
  }
}
