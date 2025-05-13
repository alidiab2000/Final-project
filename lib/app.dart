import 'package:final_project/core/router/router.dart';
import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/router/app_router.dart';

class EmaarElArd extends StatelessWidget {
  const EmaarElArd({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsManager.maingreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.navigationBarMenu, //TODO  appRouter.initialRoute,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
