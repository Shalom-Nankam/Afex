import 'package:farm_location/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../MVC/Controllers/location_controller.dart';
import '../MVC/Views/stateless_view.dart';

class MapContainer extends StatelessView<LocationScreen, LocationController> {
  const MapContainer(LocationController state, this.index, {Key? key})
      : super(state, key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              IconButton(
                icon: const CancelWidget(),
                onPressed: () {
                  context.read<LocationCubit>().removePoint(controller, index);
                },
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationSuccess) {
                LocationField(
                  label: 'Latitude',
                  fieldValue: controller.points[index]['Latitude']!,
                );
              }
            },
            builder: (context, state) {
              return LocationField(
                label: 'Latitude',
                fieldValue: controller.points[index]['Latitude']!,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationSuccess) {
                LocationField(
                  label: 'Longitude',
                  fieldValue: controller.points[index]['Longitude']!,
                );
              }
            },
            builder: (context, state) {
              return LocationField(
                label: 'Longitude',
                fieldValue: controller.points[index]['Longitude']!,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/images/Fr1.svg'),
                onTap: () {
                  context
                      .read<LocationCubit>()
                      .searchLocation(controller, index);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationField extends StatelessWidget {
  LocationField({
    Key? key,
    required this.label,
    required this.fieldValue,
  }) : super(key: key);
  final String label;
  final String fieldValue;
  late TextEditingController textController1;
  @override
  Widget build(BuildContext context) {
    textController1 = TextEditingController(text: fieldValue);
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: 120,
      height: 116,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Color(0xff111827),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          TextField(
            controller: textController1,
            readOnly: true,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffd1d5db))),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffd1d5db)),
                  borderRadius: BorderRadius.circular(6)),
            ),
          ),
        ],
      ),
    );
  }
}

class CancelWidget extends StatelessWidget {
  const CancelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 68,
      backgroundColor: const Color(0xffffcebf).withOpacity(0.54),
      child: SvgPicture.asset(
        'assets/images/cancel.svg',
        color: const Color(0xffc81107),
        height: 14,
        width: 14,
      ),
    );
  }
}

class SearchLocation extends StatelessWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
          color: const Color(0xff38cb89),
          borderRadius: BorderRadius.circular(8)),
      // child: const Icon(
      //   Icons.my_location_outlined,
      //   color: Colors.white,
      // ),
    );
  }
}
