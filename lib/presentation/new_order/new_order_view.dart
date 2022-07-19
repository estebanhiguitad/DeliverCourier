import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
import 'package:domain/value_object/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:domain/domain.dart';

class NewOrderView extends StatelessWidget {
  NewOrderView({Key? key}) : super(key: key);

  final startAddressCtrl = TextEditingController();
  final endAddressCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

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
          controller: startAddressCtrl,
          decoration: InputDecoration(
            label: Text('Dirección para recoger'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        TextFormField(
          controller: endAddressCtrl,
          decoration: InputDecoration(
            label: Text('Dirección de entrega'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        TextFormField(
          controller: priceCtrl,
          decoration: InputDecoration(
            label: Text('Cuanto ofreces pagar'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        TextFormField(
          controller: descriptionCtrl,
          decoration: InputDecoration(
            label: Text('Agrega una descripción'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    ));
  }

  Widget _buttonSave() {
    return BlocBuilder<NewOrderBloc, NewOrderState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              final order = Order(
                1,
                OrderState.delivered,
                descriptionCtrl.text,
                int.parse(priceCtrl.text),
                startAddressCtrl.text,
                endAddressCtrl.text,
              );
              final newOrderBloc = context.read<NewOrderBloc>();
              newOrderBloc.add(NewOrderSubmitted(order));
            },
            child: Text('Crear pedido'));
      },
    );
  }
}
