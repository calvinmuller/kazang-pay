class AddDeviceException implements Exception {
  final String message;
  final dynamic error;

  AddDeviceException(this.message, {this.error});
}