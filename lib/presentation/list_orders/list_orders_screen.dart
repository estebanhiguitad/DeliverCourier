import 'package:delivery/di_container.dart';
import 'package:delivery/presentation/list_orders/bloc/list_orders_bloc.dart';
import 'package:delivery/presentation/list_orders/list_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOrdersScreen extends StatelessWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            serviceLocator<ListOrdersBloc>()..add(ListOrdersFetched()),
        child: const ListOrdersView(),
      ),
    );
  }
}
