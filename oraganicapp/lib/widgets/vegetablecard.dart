import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oraganicapp/model/allproducts.dart';

class VegetableCard extends StatefulWidget {
  final Product product;
  const VegetableCard(
      {super.key, required this.product, required Null Function() onTap});

  @override
  State<VegetableCard> createState() => _VegetableCardState();
}

class _VegetableCardState extends State<VegetableCard> {
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Text(widget.product.price.toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
