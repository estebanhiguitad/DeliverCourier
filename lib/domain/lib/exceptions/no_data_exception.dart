class NoDataException implements Exception {
  final String? message;

  NoDataException([this.message = "No tienes pedidos"]);

  @override
  String toString() {
    return message ?? super.toString();
  }
}
