// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oraganicapp/provider/cartprovider.dart';

import 'package:provider/provider.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final finalList = provider.cart;
    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightGreen,
          ),
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 70, 141, 72),
          title: const Text("Cart Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          actions: const [Icon(Icons.shopping_cart)],
        ),
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Your Orders",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              finalList.removeAt(index);
                              setState(() {
                                // finalList.remove(index);
                              });
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.pink[50],
                            icon: Icons.delete,
                            label: "Delete",
                          ),
                        ]),
                        child: ListTile(
                          title: Text(finalList[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text('\$${finalList[index].price}',
                              style: const TextStyle(
                                color: Colors.black,
                              )),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(finalList[index].image),
                            backgroundColor:
                                const Color.fromARGB(255, 225, 188, 201),
                          ),
                          trailing: Column(
                            children: [
                              Expanded(
                                  child:
                                      _buildProductQuantity(Icons.add, index)),
                              Text(
                                finalList[index].quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              _buildProductQuantity(Icons.remove, index),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${provider.getTotalPrice()}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                      label: Text("Check Out"))
                ],
              ),
            )
          ],
        ));
  }
}
