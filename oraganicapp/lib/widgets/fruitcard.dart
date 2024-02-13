import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oraganicapp/model/allproducts.dart';

class FruitCard extends StatefulWidget {
  final Product product;
  const FruitCard({super.key, required this.product});

  @override
  State<FruitCard> createState() => _FruitCardState();
}

class _FruitCardState extends State<FruitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.accents[Random().nextInt(Colors.accents.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_border_outlined,
                    color: Color.fromARGB(255, 31, 33, 33)),
              ],
            ),
            SizedBox(
              height: 130,
              width: 130,
              child: Image.asset(
                widget.product.image,
              ),
            ),
            Text(widget.product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(widget.product.price.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
