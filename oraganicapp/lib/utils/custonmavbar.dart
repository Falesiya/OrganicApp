import 'package:flutter/material.dart';
import 'package:oraganicapp/pages/cartdetails.dart';
import 'package:oraganicapp/pages/favouritepage.dart';
import 'package:oraganicapp/pages/homescreen.dart';
import 'package:oraganicapp/pages/profilepage.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int mycurrentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    FavouritePage(),
    ProfilePage(),
    CartDetails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 178, 243, 89),
        title: const Text(
          "Fruits & Vegetable App", // Fixed typo here
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          InkWell(
            child: Icon(Icons.shopping_cart),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CartDetails())),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Drawer of Scaffold Class',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            currentIndex: mycurrentIndex,
            onTap: (index) {
              setState(() {
                mycurrentIndex = index;
              });
            },
            backgroundColor: Colors.greenAccent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: pages[mycurrentIndex],
    );
  }
}
