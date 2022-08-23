import 'package:farm_location/MVC/Controllers/location_controller.dart';
import 'package:farm_location/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(BlocProvider<LocationCubit>(
      create: (context) => LocationCubit(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, Widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, Widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ]),
      title: 'Material App',
      home: const LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
