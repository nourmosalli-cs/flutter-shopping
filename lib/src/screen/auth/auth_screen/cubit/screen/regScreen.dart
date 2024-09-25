import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Divide/divide_screen.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/data/cubit/auth_cubit.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/loginScreen.dart';
import 'package:shopping/src/shared/app_colors.dart';
import 'package:shopping/src/widget/text_field_widget.dart';

class RegScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.Basic1,
              AppColors.Basic2,
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              S.of(context).cc,
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: AppColors.mainColor,
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                  if (State is RegisterSuccess) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DivideScreen()));
                    print("RegisterSuccess");
                  } else if (state is FaildToRegister) {
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
                }, builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFieldWidget(
                          hint: 'name',
                          controller: nameController,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              border: const UnderlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              // focusedBorder: OutlineInputBorder(),
                              focusColor: Theme.of(context).primaryColor,
                              labelText: "name",
                              hintText: "name",
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.5))),
                        ),
                        SizedBox(
                          height: 10.h,
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
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.5))),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
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
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.5))),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFieldWidget(
                          hint: 'phone',
                          controller: phoneController,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              border: const UnderlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              // focusedBorder: OutlineInputBorder(),
                              focusColor: Theme.of(context).primaryColor,
                              labelText: "phone",
                              hintText: "phone",
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.5))),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Container(
                          height: 55.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [AppColors.Basic1, AppColors.Basic2],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate() == true) {
                                BlocProvider.of<AuthCubit>(context).register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text);
                              }
                              print('Sign In button pressed!');
                            },
                            child: Center(
                              child: Text(
                                state is RegisterLoading
                                    ? "Loading..."
                                    : 'Register',
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
                          height: 40.h,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                loginScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      S.of(context).Sign_in,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          color: AppColors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Text(
                                      S.of(context).Back,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.h,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
