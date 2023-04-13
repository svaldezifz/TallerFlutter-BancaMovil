import 'package:banca_movil_app/features/auth/bloc/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test user class', () {
    const user = User(name: 'Sandy', email: 'svaldez@interfaz.io');

    expect(user.email, 'svaldez@interfaz.io');
  });
}
