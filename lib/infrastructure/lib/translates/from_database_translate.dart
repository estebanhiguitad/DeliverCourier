import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';

import '../objectbox/order_entity.dart';

extension TranslateOrderFromDataBase on OrderEntity {
  Order fromOrderEntity2OrderDomain() {
    throw Exception();
  }
}

extension TranslateCustomerFromDatabase on CustomerEntity {
  Customer fromCustomerEntity2Customer() {
    throw Exception();
  }
}

extension TranslateDeliveryCourierFromDatabase on DeliveryCourierEntity {
  DeliveryCourier fromDeliveryCourierEntity2DeliveryCourier() {
    throw Exception();
  }
}
