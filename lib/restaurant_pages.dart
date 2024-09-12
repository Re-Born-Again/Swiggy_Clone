import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swiggy_clone/signin_page.dart';
import 'restaurant_container.dart';
import 'dish_pages.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

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
        body: ListView(
          children: [
            RestaurantContainer(
                name: "Restaurant Name 1",
                imglink:
                    'https://img.freepik.com/free-photo/pre-prepared-food-showcasing-ready-eat-delicious-meals-go_23-2151431710.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                rating: "Rating 1",
                location: "Location 1",
                time: "Delivery Time 1",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DishPages(
                        name: "Restaurant Name 1",
                        rating: "Rating 1",
                        location: "Location 1",
                        time: "Delivery Time 1",
                        onTap: () {},
                      ),
                    ),
                  );
                }),
            RestaurantContainer(
                name: "Restaurant Name 2",
                imglink:
                    'https://img.freepik.com/free-photo/pre-prepared-food-showcasing-ready-eat-delicious-meals-go_23-2151246080.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                rating: "Rating 2",
                location: "Location 2",
                time: "Delivery Time 2",
                onTap: () {}),
            RestaurantContainer(
                name: "Restaurant Name 3",
                imglink:
                    'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                rating: "Rating 3",
                location: "Location 3",
                time: "Delivery Time 3",
                onTap: () {}),
            RestaurantContainer(
                name: "Restaurant Name 4",
                imglink:
                    'https://img.freepik.com/premium-photo/grilled-chicken-skewers-with-rice-vegetables-served-black-plate-perfect-healthy-meal_1321417-6013.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                rating: "Rating 4",
                location: "Location 4",
                time: "Delivery Time 4",
                onTap: () {}),
            RestaurantContainer(
                name: "Restaurant Name 5",
                imglink:
                    'https://img.freepik.com/free-photo/side-view-shawarma-with-fried-potatoes-board-cookware_176474-3215.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid',
                rating: "Rating 5",
                location: "Location 5",
                time: "Delivery Time 5",
                onTap: () {}),
          ],
        ));
  }
}
