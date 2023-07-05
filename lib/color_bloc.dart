import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class BlueColorEvent extends ColorEvent {}
class GreenColorEvent extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.blue) {
    on<BlueColorEvent>((event, emit) => emit(Colors.blue));
    on<GreenColorEvent>((event, emit) => emit(Colors.green));
  }
  
}