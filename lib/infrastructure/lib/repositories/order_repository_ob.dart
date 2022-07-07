import 'package:domain/models/order.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:infrastructure/objectbox.g.dart' as object_box;
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';

import '../objectbox/order_entity.dart';

class OrderRepositoryOb implements OrderRepository {
  final object_box.Store store;

  OrderRepositoryOb(this.store);

  @override
  Future<Order> getAnOrder(int id) async {
    final orderEntity = store.box<OrderEntity>().get(id)!;
    final order = fromOrderEntity2OrderDomain(orderEntity);
    return order;
  }

  @override
  Future<List<Order>> getOrderList() async {
    final ordersEntity = store.box<OrderEntity>().getAll();
    final orders = ordersEntity
        .map((orderEntity) => fromOrderEntity2OrderDomain(orderEntity))
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

  Order fromOrderEntity2OrderDomain(OrderEntity orderEntity) => Order(
      orderEntity.id,
      orderEntity.status,
      orderEntity.description,
      orderEntity.price,
      orderEntity.startAddress,
      orderEntity.endAddress);

  Future _saveOrUpdate(Order order) async {
    OrderEntity orderEntity = OrderEntity(
        order.startAddress, order.endAddress, order.description, order.price);
    orderEntity.id = order.id;
    orderEntity.dbStatus = order.state.index;

    var customerEntity = CustomerEntity(order.customer.name);
    var deliveryCourierEntity = DeliveryCourierEntity("");
    orderEntity.customer.target = customerEntity;
    orderEntity.deliveryCourier.target = deliveryCourierEntity;
    store.box<OrderEntity>().put(orderEntity);
    store.box<OrderEntity>().put(orderEntity);
    store.box<OrderEntity>().put(orderEntity);
    store.box<OrderEntity>().put(orderEntity);
  }
}
