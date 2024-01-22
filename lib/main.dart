import 'package:employee_management/di/di_config.dart';
import 'package:flutter/material.dart';
import 'domain/repository/employee_repository.dart';
import 'my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDIDependencies();
  await getIt.get<EmployeeRepository>().initializeDB();
  runApp(const MyApp());
}
