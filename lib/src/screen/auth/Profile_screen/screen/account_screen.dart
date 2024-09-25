import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/routes/routes_name.dart';
import 'package:shopping/src/screen/auth/Profile_screen/cubit/theme_cubit.dart';
import 'package:shopping/src/screen/auth/Profile_screen/widget/forward_button.dart';
import 'package:shopping/src/screen/auth/Profile_screen/widget/setting_item.dart';
import 'package:shopping/src/screen/auth/Profile_screen/widget/setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // دالة تحديث إعدادات الإشعارات

//     void _updateNotificationSettings(bool enabled) async {
//   if (enabled) {
//     await OneSignal.shared.setExternalUserId(enabled.toString());
//   } else {
//     // Use setInAppMessageClickHandling for in-app messages
//     await OneSignal.shared.setInAppMessageClickHandling(OSInAppMessageClickHandling);
//   }
// }

    return BlocProvider(
        create: (context) => DivideCubit()..getUserData(),
        child: BlocConsumer<DivideCubit, DivideState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<DivideCubit>(context);
              if (cubit.userModel == null) cubit.getUserData();

              return Scaffold(
                  body: cubit.userModel != null
                      ? SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).Settings,
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Text(
                                S.of(context).Profil,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Image.network(cubit.userModel!.image!,
                                        width: 70.w, height: 70.h),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).Image_user,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          cubit.userModel!.name!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    ForwardButton(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/EditAccountScreen');
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Text(
                                S.of(context).Settings,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).Language,

                                icon: Ionicons.earth,
                                bgColor: Colors.orange.shade100,
                                iconColor: Colors.orange,
                                //   value: S.of(context).English,
                                onTap: () {
                                  Navigator.pushNamed(context, '/MyPage');
                                },
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).Change_Password,
                                icon: Ionicons.videocam_off,
                                bgColor: Colors.blue.shade100,
                                iconColor: Colors.green,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/ChangePasswordScreen');
                                },
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).Search,
                                icon: Ionicons.search,
                                bgColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.SearchScreen);
                                },
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).Notifications,
                                icon: Ionicons.notifications,
                                bgColor: Colors.blue.shade100,
                                iconColor: Colors.blue,
                                onTap: () {},
                              ),
                              SizedBox(height: 20.h),
                              BlocBuilder<ThemeCubit, bool>(
                                builder: (context, state) {
                                  return SettingSwitch(
                                    title: S.of(context).Dark_Mode,
                                    icon: Ionicons.earth,
                                    bgColor: Colors.purple.shade100,
                                    iconColor: Colors.purple,
                                    value: state,
                                    onTap: (value) {
                                      BlocProvider.of<ThemeCubit>(context)
                                          .toggleTheme(value: value);
                                    },
                                    label: '',
                                  );
                                },
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).C,
                                icon: Ionicons.bulb,
                                bgColor: Color.fromARGB(255, 107, 114, 3),
                                iconColor: Color.fromARGB(255, 252, 227, 7),
                                onTap: () {
                                  Navigator.pushNamed(context, '/divide');
                                },
                              ),
                              SizedBox(height: 20.h),
                              SettingItem(
                                title: S.of(context).Help,
                                icon: Ionicons.nuclear,
                                bgColor: Colors.red.shade100,
                                iconColor: Colors.red,
                                onTap: () {
                                  Navigator.pushNamed(context, '/Help');
                                },
                              ),
                            ],
                          ),
                        ))
                      : const Center(
                          child: CircularProgressIndicator(),
                        ));
            }));
  }
}

// void _updateNotificationSettings(bool enabled) async {
//   if (enabled) {
//     await OneSignal.shared.setExternalUserId(enabled.toString());
//   } else {
//     await OneSignal.shared.setSubscription(false);
//   }
// }

