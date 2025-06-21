import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/ui/crops/crops_screen.dart';
import 'package:final_project/features/agriculture/ui/home/home_view.dart';
import 'package:final_project/features/agriculture/ui/schedule/schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NaviagtionbarCubit extends Cubit<int> {
  NaviagtionbarCubit() : super(0);
  final List<Widget> destinations = [
    // TODO: ADD NAVIGATION BAR SCREENS
    HomeView(),
    CropsScreen(),
    ScheduleView(),
    Text('Profile'),
  ];
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //TODO: Change to NavBarIcon
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
