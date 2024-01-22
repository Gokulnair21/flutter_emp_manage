class EmployeeEntity {
  final String name;
  final String designation;
  final String period;
  final int id;
  final DateTime start;
  final DateTime? end;

  EmployeeEntity(
      {required this.name,
      required this.designation,
      required this.period,
      required this.id,
      required this.start,
      this.end});
}
