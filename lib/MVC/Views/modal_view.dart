import 'package:farm_location/MVC/Controllers/location_controller.dart';
import 'package:farm_location/MVC/Views/stateless_view.dart';
import 'package:farm_location/cubit/location_cubit.dart';
import 'package:farm_location/cubit/location_state.dart';
import 'package:farm_location/widgets/ListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalView extends StatelessView<LocationScreen, LocationController> {
  const ModalView(LocationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 827,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      padding: const EdgeInsets.fromLTRB(27, 27, 27, 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Farm coordinates',
                style: TextStyle(
                    color: Color(0xff383838),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  context.read<LocationCubit>().addPoint(controller);
                },
                elevation: 0,
                height: 44,
                minWidth: 116,
                color: const Color(0xff38cb89).withOpacity(0.05),
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Add points',
                      style: TextStyle(
                          color: Color(0xff38cb89),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Image.asset('assets/images/Icon1.png')
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is PointSuccess) {
                SizedBox(
                  height: 494,
                  width: double.infinity,
                  child: ListView.separated(
                    itemBuilder: ((context, index) => MapContainer(controller, index)),
                    itemCount: controller.counter,
                    separatorBuilder: (context, index) => const Divider(
                      color: Color(
                        0xff54565b,
                      ),
                      thickness: 0.5,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return SizedBox(
                height: 494,
                width: double.infinity,
                child: ListView.separated(
                  itemBuilder: ((context, index) => MapContainer(controller, index)),
                  itemCount: controller.points.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(
                      0xff54565b,
                    ),
                    thickness: 0.5,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 86,
            padding: const EdgeInsets.fromLTRB(22, 20, 20, 9),
            color: const Color(0xff38cb89).withOpacity(0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '3 Hectares',
                      style: TextStyle(
                          color: Color(0xff54565b),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    BlocConsumer<LocationCubit, LocationState>(
                      listener: (context, state) {
                        if (state is PointSuccess) {
                          Text(
                            '${controller.counter}',
                            style: const TextStyle(
                                color: Color(0xff54565b),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          );
                        }
                        if (state is PointRemoved) {
                          Text(
                            '${controller.counter}',
                            style: const TextStyle(
                                color: Color(0xff54565b),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          );
                        }
                      },
                      builder: (context, state) {
                        return Text(
                          '${controller.counter}',
                          style: const TextStyle(
                              color: Color(0xff54565b),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Text(
                      'Estimated size',
                      style: TextStyle(
                          color: Color(0xff54565b),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    Text(
                      'Points added',
                      style: TextStyle(
                          color: Color(0xff54565b),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: const Color(0xff54565b),
            onPressed: () {
              Navigator.pop(context);
            },
            height: 58,
            minWidth: double.infinity,
            child: const Text(
              'Save coordinates',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
