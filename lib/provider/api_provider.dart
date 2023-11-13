import 'package:brain_wired_mechine_test/services/users_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiservices = Provider<ApiServices>((ref) {
  return ApiServices();
});

final apiGetting = FutureProvider((ref) async {
  return ref.read(apiservices).getUsers();
});
