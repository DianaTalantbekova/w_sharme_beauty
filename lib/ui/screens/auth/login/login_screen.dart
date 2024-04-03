import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/resources/app_styles.dart';
import 'package:w_sharme_beauty/ui/screens/auth/login/widgets/text_field_widget.dart';
import 'package:w_sharme_beauty/ui/screens/auth/widgets/main_button.dart';

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
    print("=========================jghugiw ${AppLocalizations.of(context)}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                AppLocalizations.of(context).authorize,
                style: AppStyles.helper2,
              ),
              const Gap(20),
              Text(
                'Что-бы пользоваться сервисом на любом устройстве.',
                style: AppStyles.helper3,
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
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Забыли пароль?',
                    style: AppStyles.helper4,
                  ),
                ),
              ),
              const Spacer(),
              MainButton(
                onTap: () {},
                text: 'Войти',
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Регистрация',
                    style: AppStyles.helper4,
                  ),
                ),
              ),
              const Gap(50),
            ],
          ),
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
