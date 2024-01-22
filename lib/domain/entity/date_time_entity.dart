class DateTimePage {
  final String currentSelectedDate;
  final List<DateState> dayList;

  DateTimePage({required this.currentSelectedDate, required this.dayList});

  DateTimePage copyWith(
      {String? currentSelectedDate, List<DateState>? dayList}) {
    return DateTimePage(
        currentSelectedDate: currentSelectedDate ?? this.currentSelectedDate,
        dayList: dayList ?? this.dayList);
  }
}

class DateState {
  final bool isSelected;
  final bool isItToday;
  final String day;
  final int dayOfWeek;
  final DateTime dateTime;

  DateState(
      {required this.isSelected,
      required this.dateTime,
      required this.isItToday,
      required this.day,
      required this.dayOfWeek});

  DateState copyWith(
      {bool? isSelected,
      bool? isItToday,
      String? day,
      int? dayOfWeek,
      DateTime? dateTime}) {
    return DateState(
      isSelected: isSelected ?? this.isSelected,
      isItToday: isItToday ?? this.isItToday,
      day: day ?? this.day,
      dateTime: dateTime ?? this.dateTime,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    );
  }
}

enum DateTimeType { START, END }
