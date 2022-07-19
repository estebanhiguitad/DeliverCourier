import 'package:delivery/presentation/detail_order/detail_order_screen.dart';
import 'package:delivery/presentation/list_orders/list_orders_screen.dart';
import 'package:delivery/presentation/new_order/new_order_screen.dart';
import 'package:delivery/domain/lib/repositories/order_repository.dart';
import 'package:domain/use_cases/get_list_order.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'domain/lib/entities/order.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButton: createFloatingButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(nameApp),
    );
  }

  FloatingActionButton createFloatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }

  Widget buildBody(BuildContext context) {
    final service = GetListOrder(OrderRepositoryFake([]));
    return SafeArea(
      child: Expanded(
        child: Center(
          child: FutureBuilder(
            future: service(),
            builder: (context, AsyncSnapshot<List<Order>> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data ?? [];
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Text(data[index].description);
                    });
              }

              if (snapshot.hasError) {
                final Exception exception = snapshot.error as Exception;
                return buildNoOrdersView(context, exception.toString());
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Column buildNoOrdersView(BuildContext context, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/empty_placeholder.png'),
          width: 150,
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}

class OrderRepositoryFake implements OrderRepository {
  final List<Order> _list;

  OrderRepositoryFake(this._list);

  @override
  Future<List<Order>> getOrderList() async {
    return _list;
  }

  @override
  Future<Order> getAnOrder(int id) async {
    return _list.firstWhere((element) => element.id == id);
  }

  @override
  Future updateOrder(Order order) async {
    _list.removeWhere((element) => element.id == order.id);
    _list.add(order);
  }

  @override
  Future save(Order order) async {
    _list.add(order);
  }
}
