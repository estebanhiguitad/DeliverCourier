import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';

import '../objectbox/order_entity.dart';

extension TranslateFromDomain on Order {
  OrderEntity fromOrder2OrderEntity() {
    throw UnimplementedError();
  }
}

extension TranslateCustomerFromDomain on Customer {
  CustomerEntity fromCustomerDomain2CustomerEntity() {
    throw UnimplementedError();
  }
}

extension TranslateDeliveryCourierFromDomain on DeliveryCourier {
  DeliveryCourierEntity fromDeliveryCourierDomain2DeliveryCourierEntity() {
    throw UnimplementedError();
  }
}
