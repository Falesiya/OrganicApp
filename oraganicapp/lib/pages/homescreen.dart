// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:oraganicapp/model/myproducts.dart';
import 'package:oraganicapp/pages/detailscreen.dart';
import 'package:oraganicapp/widgets/productcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;

  Widget buildAllProduct() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 120,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allproducts.length,
        itemBuilder: (context, index) {
          final allproducts = MyProducts.allproducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            product: allproducts,
                          )));
            },
            child: ProductCard(
              product: allproducts,
            ),
          );
        },
      );

  Widget FruitCard() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 120,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.fruitsList.length,
        itemBuilder: (context, index) {
          final fruitsList = MyProducts.fruitsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            product: fruitsList,
                          )));
            },
            child: ProductCard(
              product: fruitsList,
            ),
          );
        },
      );

  Widget VegetableCard() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 120,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.vegetableList.length,
        itemBuilder: (context, index) {
          final vegetableList = MyProducts.vegetableList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            product: vegetableList,
                          )));
            },
            child: ProductCard(
              product: vegetableList,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Our Products",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductCategory(
                  index: 0,
                  name: "All Products",
                  isSelected: selectedCategoryIndex == 0,
                  onSelect: () {
                    setState(() {
                      selectedCategoryIndex = 0;
                    });
                  },
                ),
                ProductCategory(
                  index: 1,
                  name: "Fruits",
                  isSelected: selectedCategoryIndex == 1,
                  onSelect: () {
                    setState(() {
                      selectedCategoryIndex = 1;
                    });
                  },
                ),
                ProductCategory(
                  index: 2,
                  name: "Vegetables",
                  isSelected: selectedCategoryIndex == 2,
                  onSelect: () {
                    setState(() {
                      selectedCategoryIndex = 2;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            if (selectedCategoryIndex == 0)
              Expanded(child: buildAllProduct())
            else if (selectedCategoryIndex == 1)
              Expanded(child: FruitCard())
            else if (selectedCategoryIndex == 2)
              Expanded(child: VegetableCard())
          ],
        ),
      ),
    );
  }
}

class ProductCategory extends StatelessWidget {
  const ProductCategory({
    Key? key,
    required this.index,
    required this.name,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  final int index;
  final String name;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.red
              : const Color.fromARGB(255, 247, 182, 177),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
