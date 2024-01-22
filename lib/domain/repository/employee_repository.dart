import 'package:employee_management/data/model/employee_model.dart';

abstract class EmployeeRepository {
  Future<void> initializeDB();

  Future<void> add(EmployeeModel employeeModel);

  Future<void> delete(int id);

  List<EmployeeModel> getAllEmployees();

  Future<void> update(EmployeeModel employeeModel);

}