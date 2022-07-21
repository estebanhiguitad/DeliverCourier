import 'package:domain/entities/order.dart';
import 'package:infrastructure/objectbox/order_entity.dart';
import 'package:infrastructure/translates/from_database_translate.dart';
import 'package:infrastructure/translates/from_domain_translate.dart';
import 'package:objectbox/objectbox.dart' as object_box;

import 'order_object_box_data_source.dart';

class OrderObjectBoxDataSourceImpl implements OrderObjectBoxDataSource {
  final object_box.Store store;

  OrderObjectBoxDataSourceImpl(this.store);

  @override
  List<Order> getAll() {
    List<OrderEntity> ordersEntity = store.box<OrderEntity>().getAll();
    final orders = ordersEntity
        .map((orderEntity) => orderEntity.fromOrderEntity2OrderDomain())
        .toList();
    return orders;
  }

  @override
  Order getAnOrder(int id) {
    final orderEntity = store.box<OrderEntity>().get(id)!;
    return orderEntity.fromOrderEntity2OrderDomain();
  }

  @override
  void saveOrUpdate(Order order) async {
    OrderEntity orderEntity = order.fromOrder2OrderEntity();
    orderEntity.customer.target =
        order.customer.fromCustomerDomain2CustomerEntity();
    orderEntity.deliveryCourier.target =
        order.deliveryCourier.fromDeliveryCourierDomain2DeliveryCourierEntity();
    store.box<OrderEntity>().put(orderEntity);
  }
}
