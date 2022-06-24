import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class SignUPScreen extends StatelessWidget {
   SignUPScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>() ;
  final   TextEditingController _nameController = TextEditingController();
   final  TextEditingController _emailController = TextEditingController();
   final  TextEditingController _passwordController = TextEditingController();
   final  TextEditingController _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.start,

          children: [
            Flexible(
              child: SizedBox(height: 20.h),
            ),
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 3.5.h),
            Text(
              'Sign Up now to browse our amazing products',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 3.5.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Name',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    suffixIcon: InkWell(
                      onTap: () {
                        // StoreCubit.get(context).toggleVisibility();
                      },
                      child: const Icon(Icons.visibility),
                    ),
                    onSubmitted: (submit) {
                      // if (formKey.currentState!.validate()) {
                      //   StoreCubit.get(context).userLogin(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );
                      // }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _nameController,
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
                    obscureText: false,
                    suffixIcon: InkWell(
                      onTap: () {
                        // StoreCubit.get(context).toggleVisibility();
                      },
                      child: const Icon(Icons.visibility),
                    ),
                    onSubmitted: (submit) {
                      // if (formKey.currentState!.validate()) {
                      //   StoreCubit.get(context).userLogin(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );
                      // }
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
                  CustomTextFormField(
                    hintText: 'phone',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    suffixIcon: InkWell(
                      onTap: () {
                        // StoreCubit.get(context).toggleVisibility();
                      },
                      child: const Icon(Icons.visibility),
                    ),
                    onSubmitted: (submit) {
                      // if (formKey.currentState!.validate()) {
                      //   StoreCubit.get(context).userLogin(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );
                      // }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _phoneController,
                  ),
                ],
              ),
            )
            ,
            SizedBox(height: 3.5.h),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: 'Sign Up',
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                      //   StoreCubit.get(context).userLogin(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );
                      // }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.5.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Do you have an account ?',
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
                              '/login',
                            );
                          },
                        text: ' Login',
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
      )
    );
  }
}
