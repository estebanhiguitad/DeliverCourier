import 'package:flutter/material.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pedido #1',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Recibido'),
            ],
          ),
          Text('Description'),
          Text(
            '\$5.000',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
