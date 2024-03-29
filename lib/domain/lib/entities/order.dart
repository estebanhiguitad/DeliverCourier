import '../value_object/order_state.dart';
import 'customer.dart';
import 'delivery_courier.dart';

class Order {
  final int _id;

  final Customer customer;

  final DeliveryCourier deliveryCourier;

  int get id => _id;

  OrderState _state;

  OrderState get state => _state;

  final String _description;

  String get description => _description;

  final int _price;

  int get price => _price;

  final String _startAddress;

  String get startAddress => _startAddress;

  final String _endAddress;

  String get endAddress => _endAddress;

  Order(this._id, this._state, this._description, this._price,
      this._startAddress, this._endAddress,
      {this.customer = const Customer(0, "Customer 1"),
        this.deliveryCourier = const DeliveryCourier(0, "Delivery Courier")});

  void changeStateToNext() {
    switch (_state) {
      case OrderState.received:
        _state = OrderState.onWay;
        break;
      case OrderState.onWay:
        _state = OrderState.delivered;
        break;
      case OrderState.delivered:
        break;
    }
  }
}

