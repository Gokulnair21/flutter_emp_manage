import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entity/date_time_entity.dart';

part 'date_time_state.freezed.dart';

@freezed
abstract class DateTimeState with _$DateTimeState {
  factory DateTimeState.pageLoading() = PageLoading;

  factory DateTimeState.onPageLoaded(DateTimePage dateTimePage) = PageLoaded;

  factory DateTimeState.onPageSelected(DateState dateState) = PageSelected;

  factory DateTimeState.onSave(DateTimeType dateTimeType,DateTime? dateTime) = OnSave;
}
