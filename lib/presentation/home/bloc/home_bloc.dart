import 'package:employee_management/data/model/employee_model.dart';
import 'package:employee_management/domain/entity/employee_entity.dart';
import 'package:employee_management/domain/repository/employee_repository.dart';
import 'package:employee_management/presentation/home/bloc/home_state.dart';
import 'package:employee_management/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this._employeeRepository) : super(const HomeState.dataLoading());

  final EmployeeRepository _employeeRepository;

  List<EmployeeEntity> undoStack = [];

  deleteData(EmployeeEntity employee) async {
    await _employeeRepository.delete(employee.id);
    undoStack.add(employee);
    emit(const HomeState.employeeDeleted());
    getEmployeeList();
  }

  void getEmployeeList() async {
    final employeeList = _employeeRepository.getAllEmployees().reversed;
    if (employeeList.isEmpty) {
      emit(const HomeState.noDataPresent());
      return;
    }
    final current = employeeList
        .where((element) => element.endDate == null)
        .map((e) => EmployeeEntity(
            name: e.name,
            designation: e.designation,
            period: "From ${e.startDate.formatDate()}",
            start: e.startDate,
            end: e.endDate,
            id: e.id))
        .toList();
    final previous = employeeList
        .where((element) => element.endDate != null)
        .map((e) => EmployeeEntity(
            name: e.name,
            designation: e.designation,
            start: e.startDate,
            end: e.endDate,
            period:
                "From  ${e.startDate.formatDate()} to ${e.endDate?.formatDate()}",
            id: e.id))
        .toList();
    emit(HomeState.dataLoaded(current, previous));
  }

  void onUndo() async {
    final entity = undoStack.last;
    final employee = EmployeeModel(
        id: entity.id,
        name: entity.name,
        designation: entity.designation,
        startDate: entity.start,
        endDate: entity.end);
    await _employeeRepository.add(employee);
    getEmployeeList();
  }
}
