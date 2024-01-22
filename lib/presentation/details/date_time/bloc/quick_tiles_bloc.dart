import 'package:employee_management/domain/entity/date_time_entity.dart';
import 'package:employee_management/presentation/details/date_time/bloc/quick_tiles_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class QuickTilesBloc extends Cubit<QuickTilesState> {
  QuickTilesBloc() : super(QuickTilesState.initial());

  var startDateQuickTiles = [
    "Today",
    "Next Monday",
    "Next Tuesday",
    "After 1 week"
  ];
  var endDateQuickTiles = ["No Date", "Today"];

  String _selected = "";

  String get selected => _selected;

  void setSelected(String selected) {
    _selected = selected;
    emit(QuickTilesState.onSelect(selected));
  }

  List<String> getOptionsList(DateTimeType dateTimeType) {
    switch (dateTimeType) {
      case DateTimeType.START:
        return startDateQuickTiles;
      case DateTimeType.END:
        return endDateQuickTiles;
    }
  }

  initialize() {
    _selected = "";
    emit(QuickTilesState.initial());
  }
}
