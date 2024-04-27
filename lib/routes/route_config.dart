
import 'package:employee_management/domain/entity/employee_entity.dart';
import 'package:employee_management/presentation/details/details_page.dart';
import 'package:employee_management/presentation/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route.dart';

class MyRouterConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME_PAGE:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case Routes.DETAILS_PAGE:
        final data = settings.arguments as EmployeeEntity?;
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => DetailsPage(
            employeeEntity: data,
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error Occurred during navigation'),
            ),
            body: Center(
              child: Text(
                'No route defined for ${settings.name} Please contact the developer for recovery or change the route name',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        );
    }
  }
}
