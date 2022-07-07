import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:infrastructure/translates/from_database_translate.dart';
import 'package:infrastructure/translates/from_domain_translate.dart';

import '../data_sources/order_object_box_data_source.dart';
import '../objectbox/order_entity.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderObjectBoxDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  @override
  Future<Order> getAnOrder(int id) async {
    final orderEntity = _dataSource.getAnOrder(id);
    final order = orderEntity.fromOrderEntity2OrderDomain();
    return order;
  }

  @override
  Future<List<Order>> getOrderList() async {
    final ordersEntity = _dataSource.getAll();
    final orders = ordersEntity
        .map((orderEntity) => orderEntity.fromOrderEntity2OrderDomain())
        .toList();
    return orders;
  }

  @override
  Future save(Order order) async {
    await _saveOrUpdate(order);
  }

  @override
  Future updateOrder(Order order) async {
    await _saveOrUpdate(order);
  }

  Future _saveOrUpdate(Order order) async {
    OrderEntity orderEntity = order.fromOrder2OrderEntity();
    orderEntity.customer.target =
        order.customer.fromCustomerDomain2CustomerEntity();
    orderEntity.deliveryCourier.target =
        order.deliveryCourier.fromDeliveryCourierDomain2DeliveryCourierEntity();

    _dataSource.saveOrUpdate(orderEntity);
  }
}
