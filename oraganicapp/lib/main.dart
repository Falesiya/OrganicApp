import 'package:flutter/material.dart';
import 'package:oraganicapp/pages/splashpage.dart';
import 'package:oraganicapp/provider/cartprovider.dart';
import 'package:oraganicapp/provider/favouritecard.dart';
import 'package:oraganicapp/utils/custonmavbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
