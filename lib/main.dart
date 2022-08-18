import 'package:farm_location/MVC/Controllers/location_controller.dart';
import 'package:farm_location/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
  BlocProvider<LocationCubit>(
    create: (context) => LocationCubit(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
