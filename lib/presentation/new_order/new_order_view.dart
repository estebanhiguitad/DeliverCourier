import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<NewOrderBloc, NewOrderState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              final newOrderBloc = context.read<NewOrderBloc>();
              //newOrderBloc.add(NewOrderSubmitted(order));
            },
            child: Text('Crear pedido'));
      },
    );
  }
}
