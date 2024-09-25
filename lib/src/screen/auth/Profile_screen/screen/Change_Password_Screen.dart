import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/shared/constnts/constnts.dart';

class ChangePasswordScreen extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DivideCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Change_Password,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Title(
              color: Colors.grey,
              child: Image.asset(
                "images/nn.webp",
                width: 50.w,
                height: 50.h,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).Current_Password),
            ),
            SizedBox(
              height: 16.h,
            ),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: S.of(context).New_Password),
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocConsumer<DivideCubit, DivideState>(listener: (context, state) {
              if (state is ChangePasswordSuccessState) {
                showSnackBarItem(
                    context, "Password Updated Successfully", true);
                Navigator.pop(context);
              }
              if (state is ChangePasswordFailedState) {
                showSnackBarItem(context, state.error, false);
              }
            }, builder: (context, state) {
              return MaterialButton(
                onPressed: () {
                  debugPrint(
                      "From TextField : ${currentPasswordController.text} , current : $currentpassword");
                  if (currentPasswordController.text == currentpassword) {
                    if (newPasswordController.text.length >= 6) {
                      cubit.changePassword(
                          userCurrentPassword: currentpassword!,
                          newPassword: newPasswordController.text.trim());
                    } else {
                      showSnackBarItem(context,
                          "Password must be at least 6 characters", false);
                    }
                  } else {
                    showSnackBarItem(
                        context,
                        "please, verify current password, try again later",
                        false);
                  }
                },
                color: Colors.lightBlueAccent,
                height: 45.h,
                minWidth: double.infinity,
                textColor: Colors.white,
                child: Text(state is ChangePasswordLoadingState
                    ? S.of(context).Loading
                    : S.of(context).Update),
              );
            }),
          ],
        ),
      ),
    );
  }

  void showSnackBarItem(
      BuildContext context, String message, bool forSuccessOrFailure) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
    ));
  }
}
