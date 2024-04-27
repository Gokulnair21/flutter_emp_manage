import 'package:employee_management/domain/entity/date_time_entity.dart';
import 'package:employee_management/domain/entity/employee_entity.dart';
import 'package:employee_management/presentation/details/bloc/details_bloc.dart';
import 'package:employee_management/presentation/details/date_time/bloc/date_time_bloc.dart';
import 'package:employee_management/presentation/details/date_time/bloc/date_time_state.dart';
import 'package:employee_management/presentation/home/bloc/home_bloc.dart';
import 'package:employee_management/utils/colors.dart';
import 'package:employee_management/utils/constants.dart';
import 'package:employee_management/utils/extensions.dart';
import 'package:employee_management/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/ui_extensions.dart';
import 'bloc/details_state.dart';
import 'date_time/date_time_dialog.dart';
import 'text_field.dart';

class DetailsPage extends StatefulWidget {
  final EmployeeEntity? employeeEntity;

  const DetailsPage({super.key, this.employeeEntity});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with Validation {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.employeeEntity != null) {
      nameController.text = widget.employeeEntity!.name;
      desController.text = widget.employeeEntity!.designation;
      startController.text = widget.employeeEntity!.start.formatDate();
      endController.text = widget.employeeEntity!.end?.formatDate() ?? "";
    }
    context.read<DetailsBloc>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: white,
        appBar: CustomAppBarExtension.customAppBar(
          title: widget.employeeEntity != null
              ? context.localization.edit_employee_details
              : context.localization.add_employee_details,
          actions: [
            (widget.employeeEntity != null)
                ? IconButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .deleteData(widget.employeeEntity!);
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset("assets/ic_delete.svg"),
                  )
                : const SizedBox()
          ],
        ),
        body: BlocListener<DetailsBloc, DetailsState>(
          listener: (_, state) {
            state.whenOrNull(
                onDataSaved: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar.quickMessage(
                        context.localization.employee_data_added),
                  );
                  Navigator.pop(context);
                },
                onDataUpdated: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBar.quickMessage(
                        context.localization.employee_data_updated),
                  );
                  Navigator.pop(context);
                },
                onValidationFailed: (_, message) =>
                    ScaffoldMessenger.of(context)
                        .showSnackBar(AppSnackBar.quickMessage(message)));
          },
          child: BlocListener<DateTimeBloc, DateTimeState>(
            listener: (_, state) {
              state.whenOrNull(
                onSave: (type, date) {
                  switch (type) {
                    case DateTimeType.START:
                      startController.text = date?.formatDate() ?? "";
                      break;
                    case DateTimeType.END:
                      endController.text = date?.formatDate() ?? "";
                      break;
                  }
                  context.read<DetailsBloc>().setDateTime(date, type);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxExtension.h(20),
                  BorderTextFormField(
                    prefixIcon: Icons.person_outline,
                    hint: context.localization.employee_name,
                    controller: nameController,
                    fontSize: 16,
                    validator: emptyStringValidation,
                  ),
                  CustomSizedBoxExtension.h(20),
                  BorderTextFormField(
                    prefixIcon: Icons.work_outline,
                    hint: context.localization.select_role,
                    controller: desController,
                    suffixIcon: Icons.arrow_drop_down,
                    readOnly: true,
                    fontSize: 16,
                    onTap: () {
                      showBottomSheet();
                    },
                    validator: emptyStringValidation,
                  ),
                  CustomSizedBoxExtension.h(20),
                  Row(
                    children: [
                      Expanded(
                        child: BorderTextFormField(
                            prefixIcon: Icons.calendar_today_rounded,
                            hint: context.localization.start,
                            controller: startController,
                            readOnly: true,
                            fontSize: 14,
                            onTap: () {
                              showDialogBox(DateTimeType.START);
                            },
                            validator: emptyStringValidation),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            Icons.arrow_right_alt,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: BorderTextFormField(
                          prefixIcon: Icons.calendar_today_rounded,
                          hint: context.localization.end,
                          controller: endController,
                          readOnly: true,
                          fontSize: 14,
                          onTap: () {
                            showDialogBox(DateTimeType.END);
                          },
                          validator: (data) {
                            return null;
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomButtonBar(),
      ),
    );
  }

  void showDialogBox(DateTimeType dateTimeType) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: white,
        surfaceTintColor: white,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              CustomDateTimeDialog(
            dateTimeType: dateTimeType,
          ),
        ),
      ),
    );
  }

  Widget bottomButtonBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: backgroundColor, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
              if (formKey.currentState!.validate()) {
                context.read<DetailsBloc>().onSave(widget.employeeEntity,
                    nameController.text, desController.text);
                context.read<HomeBloc>().getEmployeeList();
              }
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

  void showBottomSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: white,
      builder: (_) {
        return ListView.separated(
          itemCount: Constants.DESIGINATION.length,
          shrinkWrap: true,
          itemBuilder: (_, index) => desiginationCard(
            Constants.DESIGINATION[index],
          ),
          separatorBuilder: (_, __) => const Divider(
            color: backgroundColor,
          ),
        );
      },
      context: context,
    );
  }

  Widget desiginationCard(String value) {
    return InkWell(
      onTap: () {
        desController.text = value;
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: black),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    desController.dispose();
    startController.dispose();
    endController.dispose();
    // context.read<DetailsBloc>().close();
    super.dispose();
  }
}
