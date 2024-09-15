import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swiggy_clone/signin_page.dart';
import 'restaurant_container.dart';
import 'dish_pages.dart';

class RestaurantsDetails {
  final String name;
  final String rating;
  final String imgLink;
  final String location;
  final String deliveryTime;
  final String restaurantId;
  RestaurantsDetails(
    this.name,
    this.rating,
    this.imgLink,
    this.location,
    this.deliveryTime,
    this.restaurantId,
  );
}

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  Future<List<RestaurantsDetails>> getRestaurants() async {
    List<RestaurantsDetails> restaurantsList = [];
    final restaurantsDetails =
        await FirebaseFirestore.instance.collection("Restaurants").get();
    for (final doc in restaurantsDetails.docs) {
      final data = doc.data();
      restaurantsList.add(
        RestaurantsDetails(
          data["name"],
          data["rating"],
          data["imgLink"],
          data["location"],
          data["deliveryTime"],
          doc.id,
        ),
      );
    }
    return restaurantsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Restaurants to explore",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().signOut();
                  if (context.mounted) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SigninPage()));
                  }
                },
                child: const Text('Sign out')),
          ],
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: getRestaurants(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("ERROR: ${snapshot.error}"));
              }
              final restaurants = snapshot.requireData;
              return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) => RestaurantContainer(
                    name: restaurants[index].name,
                    imglink: restaurants[index].imgLink,
                    rating: restaurants[index].rating,
                    location: restaurants[index].location,
                    time: restaurants[index].deliveryTime,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DishPages(
                            name: restaurants[index].name,
                            rating: restaurants[index].rating,
                            location: restaurants[index].location,
                            time: restaurants[index].deliveryTime,
                            onTap: () {},
                            restaurantId: restaurants[index].restaurantId,
                          ),
                        ),
                      );
                    }),
              );
            }));
  }
}
