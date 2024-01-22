import 'package:employee_management/presentation/details/date_time/bloc/date_time_bloc.dart';
import 'package:employee_management/presentation/details/date_time/bloc/quick_tiles_bloc.dart';
import 'package:employee_management/presentation/details/date_time/bloc/quick_tiles_state.dart';
import 'package:employee_management/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:employee_management/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../domain/entity/date_time_entity.dart';
import '../../../utils/ui_extensions.dart';
import 'bloc/date_time_state.dart';

class CustomDateTimeDialog extends StatefulWidget {
  const CustomDateTimeDialog({Key? key, required this.dateTimeType})
      : super(key: key);
  final DateTimeType dateTimeType;

  @override
  State<CustomDateTimeDialog> createState() => _CustomDateTimeDialogState();
}

class _CustomDateTimeDialogState extends State<CustomDateTimeDialog> {
  var weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  void initState() {
    super.initState();
    context.read<DateTimeBloc>().initialize();
    context.read<QuickTilesBloc>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuickTilesBloc, QuickTilesState>(
      listener: (_, state) {
        state.whenOrNull(
            onSelect: (tile) => context.read<DateTimeBloc>().onQuickTile(tile));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            quickOptions(),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<DateTimeBloc, DateTimeState>(builder: (_, state) {
              return state.maybeWhen(
                onPageLoaded: (data) => changeMonth(data.currentSelectedDate),
                orElse: () => const SizedBox(),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            buildWeekdayGrid(),
            buildDateList(),
            bottomBar()
          ],
        ),
      ),
    );
  }

  Widget quickOptions() {
    final bloc = context.read<QuickTilesBloc>();
    return BlocBuilder<QuickTilesBloc, QuickTilesState>(
        builder: (context, state) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bloc.getOptionsList(widget.dateTimeType).length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4.5),
        itemBuilder: (_, index) => quickOptionTile(
            bloc.getOptionsList(widget.dateTimeType)[index],
            bloc.getOptionsList(widget.dateTimeType)[index] == bloc.selected),
      );
    });
  }

  Widget quickOptionTile(String name, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        context.read<QuickTilesBloc>().setSelected(name);
      },
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? primaryColor : secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: Text(
        name,
        style: TextStyle(
            color: isSelected ? white : primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget changeMonth(String month) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<DateTimeBloc>().decrementMonth();
          },
          icon: SvgPicture.asset(
            "assets/ic_left_arrow.svg",
            height: 24,
            width: 24,
          ),
        ),
        Text(
          month,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: black),
        ),
        IconButton(
          onPressed: () {
            context.read<DateTimeBloc>().incrementMonth();
          },
          icon: SvgPicture.asset(
            "assets/ic_right_arrow.svg",
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }

  Widget buildWeekdayGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, crossAxisSpacing: 6, mainAxisSpacing: 6),
      itemCount: weekDays.length,
      itemBuilder: (context, index) {
        return weekGridItem(weekDays[index]);
      },
    );
  }

  Widget buildDateList() {
    return BlocBuilder<DateTimeBloc, DateTimeState>(
      builder: (_, state) {
        return state.maybeWhen(
          pageLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          onPageLoaded: (days) => dayGrid(days.dayList),
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  Widget dayGrid(List<DateState> dateList) {
    return GridView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 1.0),
      itemCount: dateList.length,
      // Adjust the number of dates as needed
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.read<DateTimeBloc>().setSelected(dateList[index]);
        },
        child: dateListItem(dateList[index]),
      ),
    );
  }

  Widget weekGridItem(String value) {
    return Center(
      child: Text(
        value,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: black),
      ),
    );
  }

  Widget dateListItem(DateState day) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: day.isSelected ? primaryColor : white,
          border: Border.fromBorderSide(BorderSide(
              color: day.isItToday ? primaryColor : white, width: 1))),
      child: Center(
        child: Text(
          day.day,
          style: TextStyle(
            color: day.isSelected ? white : black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: backgroundColor, width: 1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/ic_selected_calendar.svg",
            height: 23,
            width: 23,
          ),
          const SizedBox(
            width: 5,
          ),
          BlocSelector<DateTimeBloc, DateTimeState, String>(
            selector: (selected) {
              return context.read<DateTimeBloc>().selectedDate?.formatDate() ??
                  "No Date";
            },
            builder: (_, state) => Text(
              state,
              style: const TextStyle(
                  color: black, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: secondaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Text(
              context.localization.cancel,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          CustomSizedBoxExtension.w(20),
          ElevatedButton(
            onPressed: () {
              context.read<DateTimeBloc>().save(widget.dateTimeType);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Text(
              context.localization.save,
              style: const TextStyle(
                  color: white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
