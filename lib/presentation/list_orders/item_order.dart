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

  String stateOrder() {
    switch (order.state.index) {
      case 0:
        return 'Recbido';
      case 1:
        return 'En camino';
      case 2:
        return 'Entregado';
      default:
        return 'Desconocido';
    }
  }

  Color stateOrderColor() {
    switch (order.state.index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String descriptionCreatedAt() {
    return '${order.createdAt.day} Jul, ${order.createdAt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigationDetailOrderScreen(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: stateOrderColor(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pedido # ${order.uid.substring(0, 6)}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(descriptionCreatedAt()),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${order.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildTimeLine(order),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLine(Order order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo[800],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigo[100]!,
                        blurRadius: 0,
                        spreadRadius: 2)
                  ]),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(order.startAddress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]))),
          ],
        ),
        _buildLineBorder(),
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.indigo[800]!, width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigo[100]!,
                        blurRadius: 0,
                        spreadRadius: 2)
                  ]),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(order.endAddress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]))),
          ],
        )
      ],
    );
  }

  Widget _buildLineBorder() {
    return Column(
      children: <Widget>[
        _buildItemLineBorder(),
        _buildItemLineBorder(),
        _buildItemLineBorder(),
      ],
    );
  }

  Widget _buildItemLineBorder() {
    return Container(
      margin: EdgeInsets.only(left: 3.75, top: 0.5, bottom: 0.5),
      height: 2,
      width: 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[700],
      ),
    );
  }
}
