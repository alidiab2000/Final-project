import 'package:final_project/app.dart';
import 'package:final_project/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  AppRouter appRouter = AppRouter();
  runApp(EmaarElArd(appRouter: appRouter));
}
