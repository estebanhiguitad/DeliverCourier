import 'package:delivery/presentation/new_order/bloc/new_order_bloc.dart';
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
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formOrder(),
              const SizedBox(height: 16),
              _buttonSave(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Nuevo pedido'),
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
        SizedBox(height: 8),
        TextFormField(
          controller: endAddressCtrl,
          decoration: InputDecoration(
            label: Text('Dirección de entrega'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: priceCtrl,
          decoration: InputDecoration(
            label: Text('Cuanto ofreces pagar'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 8),
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

  Widget _buttonSave(BuildContext context) {
    return BlocConsumer<NewOrderBloc, NewOrderState>(
      listener: (contextBloc, state) {
        if (state is NewOrderSuccess) {
          const snackBar = SnackBar(
            content: Text('Pedido registrado correctamente'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
              onPressed: () {
                final order = Order(
                  const Uuid().v4(),
                  1,
                  OrderState.received,
                  descriptionCtrl.text,
                  int.parse(priceCtrl.text),
                  startAddressCtrl.text,
                  endAddressCtrl.text,
                );
                final newOrderBloc = context.read<NewOrderBloc>();
                newOrderBloc.add(NewOrderSubmitted(order));
              },
              child: const Text('Crear pedido')),
        );
      },
    );
  }
}
