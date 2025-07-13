import 'app.dart';
import 'core/bloc_obs/bloc_observer.dart';
import 'core/di/service_locater.dart';
import 'core/router/app_router.dart';
import 'core/widgets/functions/check_login_user.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  String initialRoute = await checkIfLoggedInAndVerfiedUser();
  AppRouter appRouter = AppRouter(initialRoute: initialRoute);
  initGetIt();
  runApp(EmaarElArd(appRouter: appRouter));
}
