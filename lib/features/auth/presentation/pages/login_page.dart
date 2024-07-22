import 'package:car_rental/core/common/widgets/loader.dart';
import 'package:car_rental/core/theme/app_pallete.dart';
import 'package:car_rental/core/utils/show_snackbar.dart';
import 'package:car_rental/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental/features/auth/presentation/pages/signup_page.dart';
import 'package:car_rental/features/auth/presentation/widgets/auth_field.dart';
import 'package:car_rental/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:car_rental/features/blog/presentation/pages/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LogInPage(),
      );

  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _SignIpPageState();
}

class _SignIpPageState extends State<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
               if(state is AuthFailure){
                showSnackBar(context,state.message);
               }else if(state is AuthSuccess){
                Navigator.pushAndRemoveUntil(
                  context, BlogPage.route(),
                   (route)=>false,
                   );
               }
              },
              builder: (context, state) {
                if(state is AuthLoading){
                  return const Loader();
                }
                return Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sign In',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 30),
                        AuthField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 15),
                        AuthField(
                          hintText: 'Password',
                          controller: passwordController,
                          isObsecureText: true,
                        ),
                        const SizedBox(height: 20),
                        AuthGradientButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthLogin(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, SignUpPage.route());
                            },
                            child: RichText(
                                text: TextSpan(
                                    text: 'Already have an account? ',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    children: [
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: AppPallete.gradient2,
                                            fontWeight: FontWeight.bold,
                                          ))
                                ])))
                      ]),
                );
              },
            )));
  }
}
