import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/Divide/divide_screen.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/data/cubit/auth_cubit.dart';
import 'package:shopping/src/routes/routes_name.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/regScreen.dart';

import 'package:shopping/src/shared/app_colors.dart';
import 'package:shopping/src/widget/text_field_widget.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Ionicons.chevron_back_outline),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [AppColors.Basic1, AppColors.Basic2]),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 80.0, left: 22),
              child: Text(
                S.of(context).zzz,
                style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: AppColors.mainColor,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is loginSuccess) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DivideScreen()));
                      }
                      if (state is Faildlogin) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                      }
                      //  {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       content: Container(
                      //     alignment: Alignment.center,
                      //     height: 50,
                      //     child: Text(state.message),
                      //   )));
                      // }
                    },
                    builder: (context, state) {
                      return Form(
                        key: formkey,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              TextFieldWidget(
                                hint: 'email',
                                controller: emailController,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.person),
                                    border: const UnderlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    // focusedBorder: OutlineInputBorder(),
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: "email",
                                    hintText: "email",
                                    errorBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2.5))),
                              ),
                              SizedBox(height: 10.h),
                              TextFieldWidget(
                                hint: 'password',
                                controller: passwordController,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.person),
                                    border: const UnderlineInputBorder(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    // focusedBorder: OutlineInputBorder(),
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: "password",
                                    hintText: "password",
                                    errorBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red,
                                                width: 2.5))),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  S.of(context).Forgot_Password,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp,
                                    color: AppColors.Basic2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Container(
                                height: 55.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.Basic1,
                                      AppColors.Basic2
                                    ],
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      BlocProvider.of<AuthCubit>(context).login(
                                          email: emailController.text,
                                          password: passwordController.text);
                                      print('Sign In button pressed!');
                                    }
                                    print('Sign In button pressed!');
                                  },
                                  child: Center(
                                    child: Text(
                                      state is loginLoading
                                          ? "Loading..."
                                          : 'SIGN IN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegScreen()));
                                      },
                                      child: Text(
                                        S.of(context).ccc,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    // MaterialButton(
                                    //   onPressed: () {
                                    //     Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 RegScreen()));
                                    //   },
                                    //   child: const Text(
                                    //     "Sign up",
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 17,
                                    //         color: AppColors.black),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
