import 'package:employeemanager/constant/extension_constants.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/constant/ui_constant.dart';
import 'package:employeemanager/feature/auth/providers/auth_provider.dart';
import 'package:employeemanager/feature/auth/screens/register_account_screen.dart';
import 'package:employeemanager/feature/home/home_screen.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:employeemanager/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 69,
              ),
              Center(
                child: Image.asset(AssetImages.appLogo),
              ),
              const SizedBox(height: 37),
              const Center(
                child: Text(
                  'Sign In',
                  // style: theme.textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              AppTextField(
                textController: emailController,
                hintText: "Enter Your Email",
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                fillColor: AppColors.fieldGrey,
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                  obscureText: true,
                  textController: passwordController,
                  // obscureText: showPassword,
                  validator: (value) {},
                  fillColor: AppColors.fieldGrey,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.fieldTextcolor),
                  // length: 327,
                  lines: 1),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // context.push(AppRoutes.forgotPasswordScreen);
                    },
                    child: const Text(
                      'Forgot password?',
                      // style: theme.textTheme.bodyMedium!
                      //     .copyWith(color: AppColors.appThemeColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // ref.read(showPasswordProvider.notifier).state =
                      //     !showPassword;
                    },
                    child: const Text(
                      'Show password',
                      // style: theme.textTheme.bodyMedium
                      //     ?.copyWith(color: AppColors.textColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showLoaderDialog(
                      context,
                      true,
                      theme: theme,
                    );
                    final response = ref.read(authProvider.notifier).loginUser(
                        emailController.text, passwordController.text);
                    response.then((response) {
                      if (response.errorMessage.isNotEmpty) {
                        return context.showSnackBar(response.errorMessage);
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) {
                            return const HomeScreen();
                          }),
                        ));
                      }
                    });
                  }
                },
                child: const Text(
                  'Sign in',
                  // style: theme.textTheme.bodyLarge!
                  //     .copyWith(color: AppColors.primary),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: AppColors.textColor),
                        children: [
                      TextSpan(
                          text: 'Register',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) {
                                  return const RegisterAccountScreen();
                                }),
                              ));
                            },
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.appThemeColor,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
