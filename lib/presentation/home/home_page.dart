import 'package:employee_management/presentation/details/details_page.dart';
import 'package:employee_management/presentation/home/bloc/home_bloc.dart';
import 'package:employee_management/presentation/home/bloc/home_state.dart';
import 'package:employee_management/utils/colors.dart';
import 'package:employee_management/utils/extensions.dart';
import 'package:employee_management/utils/ui_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/entity/employee_entity.dart';
import '../../routes/route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().getEmployeeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBarExtension.customAppBar(
          title: context.localization.employee_list),
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
              dataLoading: () => onLoading(),
              dataLoaded: (current, previous) =>
                  onEmployeeListPresent(current, previous),
              noDataPresent: () => noEmployeeDataPresent(),
              orElse: () => const SizedBox());
        },
        listener: (BuildContext context, HomeState state) {
          state.whenOrNull(
            employeeDeleted: () => ScaffoldMessenger.of(context).showSnackBar(
              AppSnackBar.quickMessageWithButton(
                  context.localization.employee_data_deleted,
                  context.localization.undo, () {
                context.read<HomeBloc>().onUndo();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(AppSnackBar.quickMessage("Deleted"));
          Navigator.pushNamed(context, Routes.DETAILS_PAGE);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget onLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }

  Widget noEmployeeDataPresent() {
    return Center(
      child: SvgPicture.asset(
        'assets/no_employee_found.svg',
      ),
    );
  }

  Widget onEmployeeListPresent(
      List<EmployeeEntity> current, List<EmployeeEntity> previous) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (current.isNotEmpty)
              ? showEmployeeList(context.localization.current_employee, current)
              : const SizedBox(),
          (previous.isNotEmpty)
              ? showEmployeeList(
                  context.localization.previous_employee, previous)
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Text(
              context.localization.swipe_left_to_delete,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: textFieldHintColor),
            ),
          )
        ],
      ),
    );
  }

  Widget showEmployeeList(String label, List<EmployeeEntity> employeeList) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Text(
                label,
                style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: employeeList.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return employeeCard(employeeList[index]);
              },
            )
          ],
        )
      ],
    );
  }

  Widget employeeCard(EmployeeEntity employee) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => DetailsPage(employeeEntity: employee),
          ),
        );
      },
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/ic_delete.svg",
              ),
            ],
          ),
        ),
        onDismissed: (_) {
          context.read<HomeBloc>().deleteData(employee);
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 1),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  employee.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  employee.designation,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400, color: grey),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  employee.period,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: grey),
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
