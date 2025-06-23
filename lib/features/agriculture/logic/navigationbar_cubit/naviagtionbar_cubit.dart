import 'package:bloc/bloc.dart';
import 'package:final_project/features/agriculture/ui/crops/crops_screen.dart';
import 'package:final_project/features/agriculture/ui/home/home_view.dart';
import 'package:final_project/features/agriculture/ui/profile_view/profile_screen.dart';
import 'package:final_project/features/agriculture/ui/schedule/schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NaviagtionbarCubit extends Cubit<int> {
  NaviagtionbarCubit() : super(0);
  final List<Widget> destinations = [
    HomeView(),
    CropsScreen(),
    ScheduleView(),
    ProfileView(userName: "Ali Diab", userEmail: "a@b.com"),
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
