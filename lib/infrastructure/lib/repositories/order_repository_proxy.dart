import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:infrastructure/data_source/local/order_local_data_source.dart';

class OrderRepositoryProxy implements OrderRepository {
  OrderRepositoryProxy(this._orderLocalDataSource);

  final OrderLocalDataSource _orderLocalDataSource;

  @override
  Future<Order> getAnOrder(int id) async {
    return _orderLocalDataSource.getByUid(id.toString());
  }

  @override
  Future<List<Order>> getOrderList() async {
    return _orderLocalDataSource.get();
  }

  @override
  Future save(Order order) async {
    _orderLocalDataSource.insert(order);
  }

  @override
  Future updateOrder(Order order) async {
    _orderLocalDataSource.update(order);
  }
}
