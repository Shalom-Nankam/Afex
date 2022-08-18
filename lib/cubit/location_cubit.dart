import 'package:farm_location/MVC/Controllers/location_controller.dart';
import 'package:farm_location/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> searchLocation(LocationController controller, int index) async {
    emit(LocationInitial());
    try {
      await controller.updatePosition(index);
      emit(LocationSuccess());
      
    } catch (e) {
      emit(LocationError());
    }
  }

  addPoint(LocationController controller) {
    emit(PointInitial());
    try {
      controller.incrementCounter();
      emit(PointSuccess());
    } catch (e) {
      emit(LocationError());
    }
  }

  removePoint(LocationController controller, int index) {
    try {
      controller.decrementCounter(index);
      emit(PointRemoved());
    } catch (e) {
      emit(LocationError());
    }
  }
}
