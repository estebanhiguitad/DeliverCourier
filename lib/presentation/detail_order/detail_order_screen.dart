import 'package:flutter/material.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_title(), _price()],
          ),
          SizedBox(height: 24),
          _infoOrder(),
          SizedBox(height: 24),
          _status()
        ],
      ),
    );
  }

  Widget _title() {
    return Text('Detalle del pedido #1');
  }

  Widget _price() {
    return Text("5.000");
  }

  Widget _infoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('Direccion a recoger: Calle 44 A 5 Bis 88')],
    );
  }

  Widget _status() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('Recibido'), Text('En camino'), Text('Entregado')],
    );
  }
}
