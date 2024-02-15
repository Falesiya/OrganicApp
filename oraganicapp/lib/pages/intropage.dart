import 'package:flutter/material.dart';
import 'package:oraganicapp/utils/custonmavbar.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/splashimage.gif"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                "We Provide Organic Fruits & Vegetables at Your DoorStep",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomNavBar()));
            },
            child: Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.green[600],
                border: Border.all(color: Colors.green),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text("Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
