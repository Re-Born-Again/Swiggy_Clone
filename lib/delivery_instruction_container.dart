import 'package:flutter/material.dart';

class DeliveryInstructionsContainer extends StatefulWidget {
  final String textContent;
  final IconData iconContent;
  const DeliveryInstructionsContainer({
    super.key,
    required this.textContent,
    required this.iconContent,
  });

  @override
  State<DeliveryInstructionsContainer> createState() =>
      _DeliveryInstructionsContainerState();
}

class _DeliveryInstructionsContainerState
    extends State<DeliveryInstructionsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(widget.iconContent),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.textContent,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
