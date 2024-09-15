import 'package:flutter/material.dart';

class RestaurantContainer extends StatelessWidget {
  final String name;
  final String imglink;
  final String rating;
  final String location;
  final String time;
  final VoidCallback onTap;
  const RestaurantContainer({
    super.key,
    required this.name,
    required this.imglink,
    required this.rating,
    required this.location,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.white,
          elevation: 0, // to remove the shadow effect of the card
          margin:
              const EdgeInsets.fromLTRB(20, 0, 20, 40), // space between widgets
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imglink,
                  height: 140, // Fixed height for the image
                  width: 120, // Fixed width for the image
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.green,
                            size: 20,
                          ),
                          Text(
                            '$rating • $time',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(location),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
