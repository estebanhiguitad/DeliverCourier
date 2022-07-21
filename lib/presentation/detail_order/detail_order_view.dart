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
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_infoOrder(), SizedBox(height: 24), _status()],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Detalle del pedido #1'),
    );
  }

  Widget _infoOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Direccion a recoger: ${order.startAddress}'),
        SizedBox(height: 8),
        Text('Direccion a entregar: ${order.endAddress}'),
        SizedBox(height: 8),
        Text('Descripción: ${order.description}'),
        SizedBox(height: 8),
        Text('Precio: \$${order.price}')
      ],
    );
  }

  Widget _status() {
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemStatus(
              icon: order.state.index == 0
                  ? Icons.check_circle_outline_outlined
                  : Icons.remove_circle_outline_rounded,
              labelText: 'Recibido',
              onTap: () {
                final updationOrderBloc = context.read<UpdationOrderBloc>();
                updationOrderBloc.add(UpdationOrderSubmitted(order));
              },
            ),
            _itemStatus(
              icon: order.state.index == 1
                  ? Icons.check_circle_outline_outlined
                  : Icons.remove_circle_outline_rounded,
              labelText: 'En camino',
              onTap: () {
                final updationOrderBloc = context.read<UpdationOrderBloc>();
                updationOrderBloc.add(UpdationOrderSubmitted(order));
              },
            ),
            _itemStatus(
              icon: order.state.index == 2
                  ? Icons.check_circle_outline_outlined
                  : Icons.remove_circle_outline_rounded,
              labelText: 'Entregado',
              onTap: () {
                final updationOrderBloc = context.read<UpdationOrderBloc>();
                updationOrderBloc.add(UpdationOrderSubmitted(order));
              },
            ),
          ],
        );
      },
    );
  }

  Widget _itemStatus({
    required IconData icon,
    required String labelText,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [Icon(icon), const SizedBox(width: 8), Text(labelText)],
        ),
      ),
    );
  }
}
