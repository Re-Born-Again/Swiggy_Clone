import 'package:flutter/material.dart';
import 'package:swiggy_clone/payment_container.dart';

class PaymentOptions {
  final String name;
  final String imgLink;
  PaymentOptions({required this.name, required this.imgLink});
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<PaymentOptions> paymentOptions = [
    PaymentOptions(
      name: "123@okaxis",
      imgLink:
          "https://img.freepik.com/premium-vector/google-wallet-logo_689336-957.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid",
    ),
    PaymentOptions(
      name: "123@okicici",
      imgLink:
          "https://img.freepik.com/premium-vector/google-wallet-logo_689336-957.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid",
    ),
    PaymentOptions(
      name: "123@okhdfcbank",
      imgLink:
          "https://img.freepik.com/premium-vector/google-wallet-logo_689336-957.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid",
    ),
    PaymentOptions(
      name: "123@oksbi",
      imgLink:
          "https://img.freepik.com/premium-vector/google-wallet-logo_689336-957.jpg?size=626&ext=jpg&ga=GA1.1.1387024122.1708704045&semt=ais_hybrid",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Page"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preferred Payments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  itemCount: paymentOptions.length,
                  itemBuilder: (context, index) {
                    final option = paymentOptions[index];
                    return PaymentContainer(
                      name: option.name,
                      imgLink: option.imgLink,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
