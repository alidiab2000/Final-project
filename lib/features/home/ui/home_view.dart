import 'package:flutter/material.dart';

import '../../../core/widgets/popups/snakbars.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed:
              () =>
                  CustomSnakbars.errorSnackBar(context, title: "Login Success"),
          child: Text('Login Success'),
        ),
      ),
    );
  }
}
