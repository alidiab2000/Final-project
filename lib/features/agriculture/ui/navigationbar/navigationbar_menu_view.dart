import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/navigationbar_cubit/naviagtionbar_cubit.dart';

class NavigationBarMenuView extends StatelessWidget {
  const NavigationBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NaviagtionbarCubit>();

    return FutureBuilder(
      future: navCubit.loadUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while fetching user data
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        // Once loaded, show the navigation bar
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFFEDEDED),
            selectedItemColor: ColorsManager.maingreen,
            unselectedItemColor: Colors.grey,
            currentIndex: context.watch<NaviagtionbarCubit>().state,
            onTap: (index) => navCubit.setIndex(index),
            items: navCubit.items,
          ),
          body: BlocBuilder<NaviagtionbarCubit, int>(
            builder: (context, selectedIndex) {
              return SafeArea(child: navCubit.destinations[selectedIndex]);
            },
          ),
        );
      },
    );
  }
}
