import 'package:employee_management/data/model/employee_model.dart';
import 'package:employee_management/domain/entity/date_time_entity.dart';
import 'package:employee_management/domain/entity/employee_entity.dart';
import 'package:employee_management/domain/repository/employee_repository.dart';
import 'package:employee_management/presentation/details/bloc/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DetailsBloc extends Cubit<DetailsState> {
  DetailsBloc(this._employeeRepository) : super(DetailsState.initialize());
  final EmployeeRepository _employeeRepository;

  initialize(){
    _start=null;
    _end=null;
    emit(DetailsState.initialize());
  }

  DateTime? _start;
  DateTime? _end;

  Future<void> add(String name, String des) async {
    final employee = EmployeeModel(
        name: name,
        designation: des,
        startDate: _start!,
        endDate: _end,
        id: DateTime.now().millisecondsSinceEpoch);
    await _employeeRepository.add(employee);
    emit(DetailsState.onDataSaved());
  }

  Future<void> update(
      EmployeeEntity employeeEntity, String name, String des) async {
    final employee = EmployeeModel(
        id: employeeEntity.id,
        name: name,
        designation: des,
        startDate: _start ?? employeeEntity.start,
        endDate: _end ?? employeeEntity.end);
    await _employeeRepository.update(employee);
    emit(DetailsState.onDataUpdated());
  }

  Future<void> onSave(
      EmployeeEntity? employeeEntity, String name, String des) async {
    if (employeeEntity != null) {
      final start = _start ?? employeeEntity.start;
      final end = _end ?? employeeEntity.end;
      if (end != null) {
        if (end.isBefore(start)) {
          emit(DetailsState.onValidationFailed(
              DateTime.now(), "Please select appropriate date"));
          return;
        }
      }
      await update(employeeEntity, name, des);
    } else {
      if (_start != null && _end != null) {
        if (_end!.isBefore(_start!)) {
          emit(DetailsState.onValidationFailed(
              DateTime.now(), "Please select appropriate date"));
          return;
        }
      }
      print("test");
      await add(name, des);
    }
  }

  void setDateTime(DateTime? dateTime, DateTimeType dateTimeType) {
    switch (dateTimeType) {
      case DateTimeType.START:
        _start = dateTime;
        break;
      case DateTimeType.END:
        _end = dateTime;
        break;
    }
  }
}
