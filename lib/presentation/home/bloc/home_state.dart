import 'package:employee_management/domain/entity/employee_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@immutable
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.dataLoading() = DataLoading;

  const factory HomeState.employeeDeleted() = EmployeeDeleted;

  const factory HomeState.dataLoaded(
      List<EmployeeEntity> current, List<EmployeeEntity> previous) = DataLoaded;

  const factory HomeState.noDataPresent() = NoDataPresent;
}
