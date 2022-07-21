import 'package:delivery/presentation/detail_order/bloc/updation_order_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailOrderView extends StatelessWidget {
  const DetailOrderView({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
      ),
    );
  }

  Widget _title() {
    return Text('Detalle del pedido #1');
  }

  Widget _price() {
    return Text('\$${order.price}');
  }

  Widget _infoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('Direccion a recoger: ${order.startAddress}')],
    );
  }

  Widget _status() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemStatus(
          icon: Icons.check_circle_outline_outlined,
          labelText: 'Recibido',
          onTap: () {},
        ),
        _itemStatus(
          icon: Icons.check_circle_outline_outlined,
          labelText: 'En camino',
          onTap: () {},
        ),
        _itemStatus(
          icon: Icons.check_circle_outline_outlined,
          labelText: 'Entregado',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _itemStatus({
    required IconData icon,
    required String labelText,
    required Function() onTap,
  }) {
    return BlocConsumer<UpdationOrderBloc, UpdationOrderState>(
      listener: (context, state) {
        if (state is UpdationOrderSuccess) {
          const snackBar = SnackBar(
            content: Text('Pedido editado correctamente'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final updationOrderBloc = context.read<UpdationOrderBloc>();
            updationOrderBloc.add(UpdationOrderSubmitted(order));
          },
          child: Row(
            children: [Icon(icon), const SizedBox(width: 8), Text(labelText)],
          ),
        );
      },
    );
  }
}
