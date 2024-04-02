import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'app/my_app.dart';
import 'ui/screens/auth/login/login_screen.dart';
import 'ui/screens/navigation_screen/navigation_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

   runApp(
        ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (BuildContext context, Widget? child) => MyApp(),
        ),

   );
}







