import 'package:objectbox/objectbox.dart';

@Entity()
class CustomerEntity {
  int id = 0;
  String name;

  CustomerEntity(this.name);
}
