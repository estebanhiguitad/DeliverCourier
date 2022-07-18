import 'package:domain/exceptions/no_data_exception.dart';

import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetListOrder {
  OrderRepository repository;

  GetListOrder(this.repository);

  Future<List<Order>> getOrderList() async {
    final result = await repository.getOrderList();
    if (result.isEmpty) {
      throw NoDataException();
    }
    return result;
  }
}
