import 'package:flutter/material.dart';

class PaymentContainer extends StatefulWidget {
  final String name;
  final String imgLink;
  const PaymentContainer({
    super.key,
    required this.name,
    required this.imgLink,
  });

  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imgLink,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            Text(widget.name),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Successfully Paid!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text("PAY"),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
