import 'package:employee_management/di/di_config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit(initializerName: "init", preferRelativeImports: true)
configureDIDependencies() => getIt.init();
