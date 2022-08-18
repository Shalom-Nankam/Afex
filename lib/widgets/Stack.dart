import 'package:farm_location/MVC/Views/modal_view.dart';
import 'package:flutter/material.dart';
import 'package:farm_location/MVC/Views/stateless_view.dart';
import 'package:farm_location/MVC/Controllers/location_controller.dart';

class Stacks extends StatelessView<LocationScreen, LocationController> {
  const Stacks(LocationController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset('assets/images/maps.png'),
          Positioned(
            top: 61.08,
            left: 114.08,
            child: Image.asset('assets/images/Polygon.png'),
          ),
          Positioned(
            top: 11,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              height: 54,
              width: 358,
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(
                    Icons.map_outlined,
                    color: Color(0xff1d925d),
                    size: 16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${controller.counter} coordinates added',
                    style: const TextStyle(
                        color: Color(0xff54565b),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isDismissible: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        isScrollControlled: true,
                        enableDrag: true,
                        context: context,
                        builder: (context) => ModalView(controller),
                      );
                    },
                    child: const Text(
                      'Click to add points',
                      style: TextStyle(
                          color: Color(0xff1d925d),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
