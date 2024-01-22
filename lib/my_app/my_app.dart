import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../di/di_config.dart';
import '../presentation/details/bloc/details_bloc.dart';
import '../presentation/details/date_time/bloc/date_time_bloc.dart';
import '../presentation/details/date_time/bloc/quick_tiles_bloc.dart';
import '../presentation/home/bloc/home_bloc.dart';
import '../routes/route.dart';
import '../routes/route_config.dart';
import '../utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<HomeBloc>()),
        BlocProvider(create: (_) => getIt.get<DetailsBloc>()),
        BlocProvider(create: (_) => getIt.get<DateTimeBloc>()),
        BlocProvider(create: (_) => getIt.get<QuickTilesBloc>())
      ],
      child: MaterialApp(
        title: 'Employee Management',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
            dialogBackgroundColor: white,
            textTheme: GoogleFonts.robotoTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: primaryColor,
            )),
        onGenerateRoute: MyRouterConfig.generateRoute,
        initialRoute: Routes.HOME_PAGE,
        //  home: const CustomDateTimeDialog(),
      ),
    );
  }
}
