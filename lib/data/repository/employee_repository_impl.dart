import 'package:employee_management/data/model/employee_model.dart';
import 'package:employee_management/domain/repository/employee_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EmployeeRepository)
class EmployeeRepositoryImpl implements EmployeeRepository {
  late Box<EmployeeModel> _employeeBox;

  @override
  Future<void> initializeDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EmployeeModelAdapter());
    _employeeBox = await Hive.openBox<EmployeeModel>("employee_model");
  }

  @override
  Future<void> add(EmployeeModel employeeModel) async {
    _employeeBox.put(employeeModel.id.toString(), employeeModel);
  }

  @override
  Future<void> delete(int id) async {
    // final location =
    //     _employeeBox.values.toList().indexWhere((element) => element.id == id);
    // print("Location : $location");
    await _employeeBox.delete(id.toString());
  }

  @override
  List<EmployeeModel> getAllEmployees() {
    return _employeeBox.values.toList();
  }

  @override
  Future<void> update(EmployeeModel employeeModel) async {
    await _employeeBox.put(employeeModel.id.toString(), employeeModel);
  }
}
