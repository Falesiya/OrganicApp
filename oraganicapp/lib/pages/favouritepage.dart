import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oraganicapp/provider/favouritecard.dart';

import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final finalList = provider.favouriteProducts;

    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('WishList',
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
                          subtitle: Text(finalList[index].description,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                              )),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(finalList[index].image),
                            backgroundColor:
                                const Color.fromARGB(255, 225, 188, 201),
                          ),
                          trailing: Text('\$${finalList[index].price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
