import 'package:flutter/material.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/loginScreen.dart';
import 'package:shopping/src/screen/auth/auth_screen/cubit/screen/regScreen.dart';
import 'package:shopping/src/shared/app_colors.dart';
import 'package:shopping/generated/l10n.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [AppColors.Basic1, AppColors.Basic2])),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Image(image: AssetImage('assets/logo.png')),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            S.of(context).Welcome_Back,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.mainColor),
              ),
              child: Center(
                child: Text(
                  S.of(context).Sign_in,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.mainColor),
              ),
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            S.of(context).xxx,
            style: const TextStyle(fontSize: 17, color: AppColors.mainColor),
          ), //
          const SizedBox(
            height: 12,
          ),
          const Image(image: AssetImage('assets/social.png'))
        ]),
      ),
    );
  }
}
