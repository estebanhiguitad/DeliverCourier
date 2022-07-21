import 'package:delivery/presentation/detail_order/detail_order_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key, required this.order}) : super(key: key);

  final Order order;

  navigationDetailOrderScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailOrderScreen(order: order)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigationDetailOrderScreen(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
            SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recoger en: ${order.startAddress}'),
                Text('Descripción: ${order.description}'),
              ],
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$${order.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
