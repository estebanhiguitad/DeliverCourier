import 'package:delivery/presentation/list_orders/bloc/list_orders_bloc.dart';
import 'package:delivery/presentation/list_orders/item_order.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _header(context),
          const SizedBox(height: 16),
          BlocBuilder<ListOrdersBloc, ListOrdersState>(
            builder: (context, state) {
              if (state is ListOrdersSuccess) {
                return state.orders.isEmpty
                    ? _listOrdersEmpty(
                        context, 'No se encontraron pedidos registrados')
                    : _listOrders(state.orders);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Listado de pedidos',
            style: Theme.of(context).textTheme.titleLarge),
        GestureDetector(
          onTap: () {
            final listOrdersBloc = BlocProvider.of<ListOrdersBloc>(context);
            listOrdersBloc.add(ListOrdersFetched());
          },
          child: Icon(Icons.refresh_rounded),
        )
      ],
    );
  }

  Widget _listOrders(List<Order> orders) {
    return Expanded(
      child: ListView(
        children: orders.map((order) => ItemOrder(order: order)).toList(),
      ),
    );
  }

  Widget _listOrdersEmpty(BuildContext context, String message) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/empty_placeholder.png'),
          width: 128,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
