import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'restaurant_pages.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  Future<void> signin() async {
    var gSignIn = GoogleSignIn();
    var loginResult = await gSignIn.signIn();
    if (loginResult == null) {
      if (kDebugMode) {
        print("Error");
      }
    } else {
      var account = await loginResult.authentication;
      var creds = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
              accessToken: account.accessToken, idToken: account.idToken));
      final user = creds.user;
      if (user == null) {
        if (kDebugMode) {
          print("Error");
        }
      } else {
        if (mounted) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const RestaurantPage()));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                  "https://img.freepik.com/free-photo/top-view-eid-al-fitr-celebration-with-delicious-food_23-2151205175.jpg?t=st=1725815495~exp=1725819095~hmac=fb8c990f11ee9729af615ef2086aafbf784ecb48a9052c5987a3f7f2eead2d09&w=826",
                ),
                fit:
                    BoxFit.cover, // Makes the image cover the entire background
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), // Dims the image
                  BlendMode.darken, // Darkens the image
                ),
              ),
            ),
          ),
          // Foreground with content
          Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoTMbb_jDMSO9POq4OyT5EGl625TlJKsCxQA&s",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 110,
                  width: 110,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "SWIGGY APP",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 140, 0),
                        fontWeight:
                            FontWeight.bold), // Changed to white for contrast
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: signin,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                          width: 10), // Space between the logo and text
                      const Text('Sign in'),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RestaurantPage(),
                      ),
                    );
                  },
                  child: const Text("Next Page"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
