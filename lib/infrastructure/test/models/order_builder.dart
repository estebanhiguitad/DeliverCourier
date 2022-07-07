import 'package:domain/models/order.dart';
import 'package:domain/models/order_state.dart';

class OrderBuilder {
  int id = 0;
  OrderState state = OrderState.received;
  String description = "Description";
  int price = 1000;
  String startAddress = "Start address";
  String endAddress = "End address";

  OrderBuilder withState(OrderState state) {
    this.state = state;
    return this;
  }

  withId(int id) {
    this.id = id;
    return this;
  }

  withDescription(String description) {
    this.description = description;
    return this;
  }

  Order build() =>
      Order(id, state, description, price, startAddress, endAddress);
}
