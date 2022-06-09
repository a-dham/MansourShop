// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/store_cubit.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:mansour_shop/network/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => StoreCubit(),
        child: BlocConsumer<StoreCubit, StoreState>(
          listener: (context, state) {
            if (state is StoreLoginSuccessState) {
              if (state.loginModel.status) {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    margin: EdgeInsets.all(20.w),
                    height: 10.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Text(state.loginModel.message),
                  ),
                );
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.data!.token)
                    .then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, home, (route) => false);
                });
              } else {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    margin:
                        EdgeInsets.only(right: 10.w, left: 10.w, bottom: 10.h),
                    height: 10.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    alignment: Alignment.center,
                    child: Text(state.loginModel.message),
                  ),
                );
              }
            }
          },
          builder: (context, state) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SizedBox(height: 20.h),
                    ),
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 3.5.h),
                    Text(
                      'Login now to browse our amazing products',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 3.5.h),
                    CustomTextFormField(
                      hintText: 'Email Address',
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      onSubmitted: (submit) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      controller: _emailController,
                      suffixIcon: null,
                    ),
                    SizedBox(height: 3.5.h),
                    CustomTextFormField(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: StoreCubit.get(context).isObSecure,
                      suffixIcon: InkWell(
                        onTap: () {
                          StoreCubit.get(context).toggleVisibility();
                        },
                        child: StoreCubit.get(context).isVisible,
                      ),
                      onSubmitted: (submit) {
                        if (formKey.currentState!.validate()) {
                          StoreCubit.get(context).userLogin(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                    ),
                    SizedBox(height: 3.5.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            text: 'Login',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                StoreCubit.get(context).userLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.5.h),
                    Align(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              TextSpan(
                                onEnter: (value) {},
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      '/register',
                                    );
                                  },
                                text: 'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.blue,
                                    ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
