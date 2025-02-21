import 'package:final_project/app.dart';
import 'package:final_project/core/bloc_obs/bloc_observer.dart';
import 'package:final_project/core/router/app_router.dart';
import 'package:final_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  AppRouter appRouter = AppRouter();
  runApp(EmaarElArd(appRouter: appRouter));
}
