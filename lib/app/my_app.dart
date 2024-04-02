import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/auth/login/login_screen.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const LoginScreen();
          },
          //routes: [
          // GoRoute(
          //   path: 'sign_up_screen',
          //   builder: (context, state) {
          //     return const SignUpScreen();
          //   },
          // ),
          //],
        ),
        //ShellRoute(
        //   builder: (context, state, child) {
        //     return NavigationScreen(
        //       child: child,
        //     );
        //   },
        //routes: [
        // GoRoute(
        //   path: '/',
        //   pageBuilder: (context, state) => buildPageWithDefaultTransition(
        //     child: LoginScreen(
        //     ),
        //     context: context,
        //     state: state,
        //   ),
        //   routes: [
        //     GoRoute(
        //       path: "favourites_screen",
        //       pageBuilder: (context, state) {
        //         return buildPageWithDefaultTransition(
        //           context: context,
        //           state: state,
        //           child: FavouritesScreen(
        //             newsBloc: context.read<NewsBloc>(),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),

        //],
        // ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      // supportedLocales: [Locale('en', 'US')],
    );
  }
}