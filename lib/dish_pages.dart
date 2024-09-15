import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'order_pages.dart';
import 'dish_container.dart';

class DishInfo {
  final String name;
  final int price;
  final String rating;
  final String description;
  final String imgLink;
  int count;
  DishInfo({
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.imgLink,
    this.count = 0,
  });
}

class DishPages extends StatefulWidget {
  final String name;
  final String rating;
  final String location;
  final String time;
  final String restaurantId;
  final VoidCallback onTap;
  const DishPages({
    super.key,
    required this.name,
    required this.rating,
    required this.location,
    required this.time,
    required this.onTap,
    required this.restaurantId,
  });

  @override
  State<DishPages> createState() => _DishPagesState();
}

class _DishPagesState extends State<DishPages> {
  List<DishInfo> dishInfo = [];
  bool isLoading = true;

  Future<void> getDishes() async {
    List<DishInfo> dishList = [];
    final dishDetails = await FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(widget.restaurantId)
        .collection('Dishes')
        .get();
    for (final doc in dishDetails.docs) {
      final data = doc.data();
      dishList.add(
        DishInfo(
          name: data["name"],
          price: data['price'],
          description: data['description'],
          imgLink: data['imgLink'],
          rating: data['rating'],
          count: 0,
        ),
      );
    }
    setState(() {
      dishInfo = dishList;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDishes();
  }

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
          Column(
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
                                widget.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "${widget.time} • ${widget.location}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                              Text(widget.rating),
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
                ),
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: dishInfo.length,
                        itemBuilder: (context, index) {
                          final info = dishInfo[index];
                          return DishContainer(
                            dishName: info.name,
                            price: info.price,
                            rating: info.rating,
                            description: info.description,
                            imgLink: info.imgLink,
                            count: info.count,
                            onTapPlus: () {
                              setState(() {
                                info.count++;
                              });
                            },
                            onTapMinus: () {
                              setState(() {
                                info.count =
                                    info.count == 1 ? 0 : info.count - 1;
                              });
                            },
                          );
                        },
                      ),
              ),
              const SizedBox(
                height: 50,
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
                  final l = <DishInfo>[];
                  for (final dish in dishInfo) {
                    if (dish.count > 0) {
                      l.add(dish);
                    }
                  }
                  if (l.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPages(dishes: l),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please select atleast 1 dish!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        duration: Duration(seconds: 1, milliseconds: 500),
                        backgroundColor: Color.fromARGB(255, 84, 84, 84),
                      ),
                    );
                  }
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
