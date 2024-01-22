import 'package:employee_management/domain/entity/date_time_entity.dart';
import 'package:employee_management/presentation/details/date_time/bloc/date_time_state.dart';
import 'package:employee_management/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DateTimeBloc extends Cubit<DateTimeState> {
  DateTimeBloc() : super(DateTimeState.pageLoading());

  late DateTimePage _currentPageData;
  DateTime currentDateTime = DateTime.now();
  final DateTime _today = DateTime.now();
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void _loadPage() {
    DateTime firstDayOfMonth =
        DateTime(currentDateTime.year, currentDateTime.month, 1);
    int daysInMonth =
        DateTime(currentDateTime.year, currentDateTime.month + 1, 0).day;

    List<DateState> daysList = [];

    for (int i = 0; i < daysInMonth; i++) {
      DateTime currentDay = firstDayOfMonth.add(Duration(days: i));
      daysList.add(DateState(
          isSelected: currentDay.day == _selectedDate?.day &&
              currentDay.month == _selectedDate?.month &&
              currentDay.year == _selectedDate?.year,
          isItToday: currentDay.day == _today.day &&
              currentDay.month == _today.month &&
              currentDay.year == _today.year,
          day: currentDay.day.toString(),
          dayOfWeek: currentDay.weekday,
          dateTime: currentDay));
    }
    final firstWeek = daysList.first.dayOfWeek;
    if (firstWeek != 7) {
      for (int i = 0; i < firstWeek; i++) {
        daysList.insert(
            0,
            DateState(
                isSelected: false,
                isItToday: false,
                day: "",
                dayOfWeek: 0,
                dateTime: DateTime.now()));
      }
    }

    _currentPageData = DateTimePage(
        currentSelectedDate:
            "${currentDateTime.getEntireMonth()} ${currentDateTime.year}",
        dayList: daysList);
    emit(DateTimeState.onPageLoaded(_currentPageData));
  }

  void setSelected(DateState dateState) {
    if (dateState.day.isEmpty) {
      return;
    }
    _currentPageData.dayList.forIndexed((pos, element) {
      if (element.day == dateState.day) {
        _currentPageData.dayList[pos] = element.copyWith(isSelected: true);
      } else {
        _currentPageData.dayList[pos] = element.copyWith(isSelected: false);
      }
    });
    emit(DateTimeState.onPageSelected(dateState));
    _selectedDate = dateState.dateTime;
    _currentPageData =
        _currentPageData.copyWith(dayList: _currentPageData.dayList);
    emit(DateTimeState.onPageLoaded(_currentPageData));
  }

  initialize() {
    currentDateTime = DateTime.now();
    _selectedDate = null;
    _loadPage();
  }

  incrementMonth() {
    currentDateTime = currentDateTime.addMonths(1);
    _loadPage();
  }

  decrementMonth() {
    currentDateTime = currentDateTime.addMonths(-1);
    _loadPage();
  }

  save(DateTimeType dateTimeType) {
    emit(DateTimeState.onSave(dateTimeType, selectedDate));
  }

  void onQuickTile(String option) {
    DateTime? now = DateTime.now();
    switch (option) {
      case "Today":
        now = DateTime.now();
        break;
      case "Next Monday":
        now = now.findNextWeekDay(DateTime.monday);
        break;
      case "Next Tuesday":
        now = now.findNextWeekDay(DateTime.tuesday);
        break;
      case "After 1 week":
        now = now.add(const Duration(days: 7));
        break;
      case "No Date":
        now = null;
        break;
    }
    _selectedDate = now;
    if (now == null) {
      initialize();
      return;
    }
    setSelected(DateState(
        isSelected: false,
        dateTime: now,
        isItToday: false,
        day: now.day.toString(),
        dayOfWeek: now.weekday));
  }
}
