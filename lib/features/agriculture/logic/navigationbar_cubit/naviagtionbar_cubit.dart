import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/ui/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NaviagtionbarCubit extends Cubit<int> {
  NaviagtionbarCubit() : super(0);
  final List<Widget> destinations = const [
    HomeView(),
    Text('Crops'),
    Text('Schedule'),
    Text('Profile'),
  ];
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Iconsax.category), label: 'Crops'),
    BottomNavigationBarItem(
      icon: Icon(Iconsax.calendar_edit),
      label: 'Schedule',
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconsax.profile_circle),
      label: 'Profile',
    ),
  ];

  void setIndex(int index) {
    emit(index);
  }
}
