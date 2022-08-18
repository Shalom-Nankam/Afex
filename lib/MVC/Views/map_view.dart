import 'package:farm_location/widgets/ButtonRow.dart';
import 'package:farm_location/widgets/ItemsColumns.dart';
import 'package:farm_location/widgets/Stack.dart';
import 'package:flutter/material.dart';
import 'package:farm_location/MVC/Controllers/location_controller.dart';
import 'package:farm_location/MVC/Views/stateless_view.dart';

class MapView extends StatelessView<LocationScreen, LocationController> {
  const MapView(LocationController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(41, 45, 50, 1),
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/f46.png',
              height: 50,
              width: 50,
            ),
          )
        ],
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SafeArea(child: Page(controller)),
      ),
    );
  }
}

class Page extends StatelessView<LocationScreen, LocationController> {
  const Page(
    LocationController state, {
    Key? key,
  }) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Register a new farmer',
          style: TextStyle(
              color: Color(0xFF383838),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          'Farm Information',
          style: TextStyle(
              color: Color(0xFF7C827d),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 30,
        ),
        const PageColumn(
          label: 'Cooperative',
          hint: 'Select Cooperative',
        ),
        const SizedBox(
          height: 54,
        ),
        const PageColumn(
          label: 'Primary crops',
          hint: 'Select primary crops',
        ),
        const SizedBox(
          height: 54,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Secondary crops',
              style: TextStyle(
                  color: Color(0xff111827),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff38cb89))),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffd1d5db)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Stacks(controller),
        const Spacer(),
        const ButtonRow(),
      ],
    );
  }
}
