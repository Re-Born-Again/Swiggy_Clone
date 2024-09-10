import 'package:flutter/material.dart';
import 'order_pages.dart';
import 'dish_container.dart';

class DishPages extends StatelessWidget {
  final String name;
  final String rating;
  final String location;
  final String time;
  final VoidCallback onTap;
  const DishPages({
    super.key,
    required this.name,
    required this.rating,
    required this.location,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dishes to explore",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "$time • $location",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(rating),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        const Text(
                          "Order above 149 for discount delivery fee",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Recommended",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
              DishContainer(
                  dishName: "Dish Name 1",
                  price: "Price 1",
                  rating: "Rating 1",
                  description: "Description 1",
                  imglink:
                      'https://img.freepik.com/free-photo/big-sandwich-hamburger-burger-with-beef-red-onion-tomato-fried-bacon_2829-5398.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                  onTap: () {}),
              DishContainer(
                  dishName: "Dish Name 2",
                  price: "Price 2",
                  rating: "Rating 2",
                  description: "Description 2",
                  imglink:
                      'https://img.freepik.com/free-photo/pasta-spaghetti-with-shrimps-sauce_1220-5072.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                  onTap: () {}),
              DishContainer(
                  dishName: "Dish Name 3",
                  price: "Price 3",
                  rating: "Rating 3",
                  description: "Description 3",
                  imglink:
                      'https://img.freepik.com/free-photo/delicious-food-table_23-2150857814.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                  onTap: () {}),
              DishContainer(
                  dishName: "Dish Name 4",
                  price: "Price 4",
                  rating: "Rating 4",
                  description: "Description 4",
                  imglink:
                      'https://img.freepik.com/free-photo/high-angle-chicken-meal_23-2148825122.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                  onTap: () {}),
              const SizedBox(
                height: 
                0,
              ),
            ],
          ),
          Positioned(
            bottom: 16, // Distance from the bottom of the screen
            right: 16, // Distance from the right of the screen
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPages(
                        dishName: "S dishName",
                        itemCount: "s itemCount",
                        price: "s price",
                      ),
                    ),
                  );
                },
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  "Order",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

