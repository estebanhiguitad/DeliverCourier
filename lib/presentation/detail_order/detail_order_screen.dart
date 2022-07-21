import 'package:delivery/di_container.dart';
import 'package:delivery/presentation/detail_order/bloc/updation_order_bloc.dart';
import 'package:delivery/presentation/detail_order/detail_order_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<UpdationOrderBloc>(),
      child: DetailOrderView(order: order),
    );
  }
}
