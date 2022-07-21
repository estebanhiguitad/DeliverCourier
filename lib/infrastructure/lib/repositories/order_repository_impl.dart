import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';

import '../data_sources/order_object_box_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderObjectBoxDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  @override
  Future<Order> getAnOrder(int id) async {
    return _dataSource.getAnOrder(id);
  }

  @override
  Future<List<Order>> getOrderList() async {
    final orders = _dataSource.getAll();
    return orders;
  }

  @override
  Future save(Order order) async {
    _dataSource.saveOrUpdate(order);
  }

  @override
  Future updateOrder(Order order) async {
    _dataSource.saveOrUpdate(order);
  }
}
