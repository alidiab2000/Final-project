import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/navigationbar_cubit/naviagtionbar_cubit.dart';

class NavigationBarMenuView extends StatelessWidget {
  const NavigationBarMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NaviagtionbarCubit>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFEDEDED),
        selectedItemColor: ColorsManager.maingreen,
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<NaviagtionbarCubit>().state,
        onTap: (index) => cubit.setIndex(index),
        items: cubit.items,
      ),
      body: BlocBuilder<NaviagtionbarCubit, int>(
        builder: (context, selectedIndex) {
          return SafeArea(child: cubit.destinations[selectedIndex]);
        },
      ),
    );
  }
}
