import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OrderEntity {
  int id = 0;
  String startAddress;
  String endAddress;
  int price;
  String description;

  OrderStatus? status;

  int? get dbStatus {
    return status?.index;
  }

  set dbStatus(int? value) {
    if (value == null) {
      status = OrderStatus.unknown;
      return;
    }

    status = value >= 0 && value < OrderStatus.values.length
        ? OrderStatus.values[value]
        : OrderStatus.received;
  }

  final customer = ToOne<CustomerEntity>();
  final deliveryCourier = ToOne<DeliveryCouriers>();

  OrderEntity(this.startAddress, this.endAddress, this.description, this.price);
}

enum OrderStatus { received, onWay, delivered, unknown }
