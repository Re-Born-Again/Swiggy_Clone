import 'package:flutter/material.dart';

class DishContainer extends StatelessWidget {
  final String dishName;
  final int price;
  final String rating;
  final String description;
  final String imgLink;
  final int count;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;
  const DishContainer({
    super.key,
    required this.dishName,
    required this.price,
    required this.rating,
    required this.description,
    required this.imgLink,
    required this.count,
    required this.onTapPlus,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 0,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishName,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹$price",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(10, 35)),
                      child: const Row(
                        children: [
                          Icon(Icons.bookmark_outline),
                          Text("Save to Eatlist",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Text(description),
                  ],
                ),
                SizedBox(
                  height: 170,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imgLink,
                          height: 150, // Fixed height for the image
                          width: 150, // Fixed width for the image
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 15,
                        child: SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              if (count == 0) {
                                onTapPlus();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    const Color.fromARGB(255, 25, 182, 30),
                                minimumSize: const Size(100, 35)),
                            child: count == 0
                                ? const Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: onTapMinus,
                                          child: const Icon(
                                            Icons.remove,
                                            color: Color.fromARGB(
                                                255, 25, 182, 30),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Text(
                                          "$count",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: onTapPlus,
                                        child: const Icon(
                                          Icons.add,
                                          color:
                                              Color.fromARGB(255, 25, 182, 30),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
