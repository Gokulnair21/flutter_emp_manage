import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String designation;

  @HiveField(3)
  final DateTime startDate;

  @HiveField(4)
  final DateTime? endDate;

  EmployeeModel(
      {required this.id,
      required this.name,
      required this.designation,
      required this.startDate,
      this.endDate});

  @override
  String toString() {
    return "id : $id name : $name  designation : $designation end date : $endDate start date : $startDate";
  }
}
