import 'package:flutter/material.dart';
import 'delivery_instruction_container.dart';

// dishName
// itemCount
// price

class OrderPages extends StatefulWidget {
  final String dishName;
  final String itemCount;
  final String price;
  const OrderPages({
    super.key,
    required this.dishName,
    required this.itemCount,
    required this.price,
  });

  @override
  State<OrderPages> createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Page"),
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      ),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 255, 241),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.green,
                )),
            child: const Text(
              '₹15 saved! On this order',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.dishName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(widget.itemCount),
                      Text(
                        widget.price,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add more items",
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add cooking requests",
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Offers & Benefits",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Apply Coupon",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          const Text(
            "Say thanks with a Tip!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                            "Day & night, our delivery partners bring your favourite meal. Thank them with a tip."),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://media.tenor.com/nPEnAi_i-f8AAAAM/mr-bean-mr-beans-holiday.gif',
                          height: 80, // Fixed height for the image
                          width: 80, // Fixed width for the image
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                        label: Text("₹20"),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      Chip(
                        label: Text("₹30"),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      Chip(
                        label: Text("₹50"),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      Chip(
                        label: Text("Other"),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Delivery Instructions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                DeliveryInstructionsContainer(
                    textContent: "Avoid ringing bell", iconContent: Icons.notifications_off),
                SizedBox(
                  width: 15,
                ),
                DeliveryInstructionsContainer(
                    textContent: "Leave at the door", iconContent: Icons.door_back_door_rounded),
                SizedBox(
                  width: 15,
                ),
                DeliveryInstructionsContainer(
                    textContent: "Directions to reach", iconContent: Icons.location_on),
                SizedBox(
                  width: 15,
                ),
                DeliveryInstructionsContainer(
                    textContent: "Avoid calling", iconContent: Icons.phone_disabled),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Bill Details",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Card(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Item Total"),
                      Text(
                        "₹100.00",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee"),
                      Text(
                        "₹40.00",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    "Order above Rs 149 for Discounted delivery!",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Extra discount for you"),
                      Text(
                        "-₹15.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 162, 5)),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Tip"),
                      Text(
                        "Add tip",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.amber),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Platform fee"),
                      Text(
                        "₹6.00",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("GST and Restaurant Chargers"),
                      Text(
                        "₹8.33",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "To Pay",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "₹139",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 45, 181, 79),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: const Text("Proceed to Pay"),
          )
        ],
      ),
    );
  }
}
