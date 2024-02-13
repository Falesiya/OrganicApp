import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oraganicapp/model/allproducts.dart';
import 'package:oraganicapp/provider/favouritecard.dart';

import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late FavouriteProvider provider;

  @override
  void didChangeDependencies() {
    provider = Provider.of<FavouriteProvider>(context);
    super.didChangeDependencies();
  }

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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => provider.toggleFavourite(widget.product),
                    child: Icon(
                        provider.isExist(widget.product)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Color.fromARGB(255, 31, 33, 33)),
                  ),
                ],
              ),
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
