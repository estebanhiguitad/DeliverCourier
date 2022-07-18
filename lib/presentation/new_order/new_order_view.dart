import 'package:flutter/material.dart';

class NewOrderView extends StatelessWidget {
  const NewOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(), _formOrder(), _buttonSave()],
      ),
    );
  }

  Widget _title() {
    return Text(
      'Nuevo pedido',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _formOrder() {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text('Dirección para recoger'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        TextFormField(
            decoration: InputDecoration(
          label: Text('Dirección de entrega'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        )),
        TextFormField(
            decoration: InputDecoration(
          label: Text('Cuanto ofreces pagar'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        )),
        TextFormField(
            decoration: InputDecoration(
          label: Text('Agrega una descripción'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        )),
      ],
    ));
  }

  Widget _buttonSave() {
    return ElevatedButton(onPressed: null, child: Text('Crear pedido'));

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Text('Crear pedido'),
    );
  }
}
