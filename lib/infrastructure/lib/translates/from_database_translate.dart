import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';

import '../objectbox/order_entity.dart';

extension TranslateOrderFromDataBase on OrderEntity {
  Order fromOrderEntity2OrderDomain() {
    late Customer customerDomain;
    if (customer.target != null) {
      final entity = customer.target!;
      customerDomain = Customer(entity.id, entity.name);
    }

    late DeliveryCourier deliveryCourierDomain;
    if (deliveryCourier.target != null) {
      final entity = deliveryCourier.target!;
      deliveryCourierDomain = DeliveryCourier(entity.id, entity.name);
    }

    final order = Order(
        id, status, description, price, startAddress, endAddress,
        customer: customerDomain, deliveryCourier: deliveryCourierDomain);
    return order;
  }
}

extension TranslateCustomerFromDatabase on CustomerEntity {
  Customer fromCustomerEntity2Customer() => Customer(id, name);
}

extension TranslateDeliveryCourierFromDatabase on DeliveryCourierEntity {
  DeliveryCourier fromDeliveryCourierEntity2DeliveryCourier() =>
      DeliveryCourier(id, name);
}
