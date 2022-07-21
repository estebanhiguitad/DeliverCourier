import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';

import '../objectbox/order_entity.dart';

extension TranslateFromDomain on Order {
  OrderEntity fromOrder2OrderEntity() {
    final orderEntity =
        OrderEntity(startAddress, endAddress, description, price);
    orderEntity.id = id;
    orderEntity.status = state;
    return orderEntity;
  }
}

extension TranslateCustomerFromDomain on Customer {
  CustomerEntity fromCustomerDomain2CustomerEntity() => CustomerEntity(name);
}

extension TranslateDeliveryCourierFromDomain on DeliveryCourier {
  DeliveryCourierEntity fromDeliveryCourierDomain2DeliveryCourierEntity() =>
      DeliveryCourierEntity(name);
}
