import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/resources/app_styles.dart';
import 'package:w_sharme_beauty/ui/screens/auth/login/widgets/text_field_widget.dart';

import '../../../../l10n/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get canConfirm =>
      emailController.text.trim().isNotEmpty &&
      passwordController.text.trim().length > 5;

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                //Strings.of(context).authorize,
                'Авторизоваться',
                style: AppStyles.helper2,
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                // Strings.of(context).toUseService,
                'Что-бы пользоваться сервисом на любом устройстве.',
                style: AppStyles.helper3,
              ),
            ),
            const Gap(30),
            TextFieldWidget(
              controller: emailController,
              hintText: 'Эл.адрес или номер телефона',
              textInputType: TextInputType.emailAddress,
            ),
            Gap(12.h),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Введите пароль',
              hasEye: true,
              isObscuredText: true,
            ),
          ],
        ),
      ),
    );
  }

// Future<void> _login() async {
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//     context.go('/');
//   } on FirebaseAuthException catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(e.message ?? 'Unexpected error'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }
}
