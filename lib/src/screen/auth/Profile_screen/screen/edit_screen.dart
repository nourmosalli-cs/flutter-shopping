import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/screen/auth/Profile_screen/widget/edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "man";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DivideCubit()..getUserData(),
      child: BlocConsumer<DivideCubit, DivideState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<DivideCubit>(context);
            if (cubit.userModel == null) cubit.getUserData();
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Ionicons.chevron_back_outline),
                  ),
                  leadingWidth: 80,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: Size(60, 50),
                          elevation: 3,
                        ),
                        icon: Icon(Ionicons.checkmark, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                body: cubit.userModel != null
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profil",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40.h),
                              EditItem(
                                title: "Photo",
                                widget: Column(
                                  children: [
                                    Image.network(
                                      cubit.userModel!.image!,
                                      height: 100.h,
                                      width: 100.w,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.lightBlueAccent,
                                      ),
                                      child: Text(
                                        "Upload Image",
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.lightBlueAccent),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    Text(cubit.userModel!.name!),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              EditItem(
                                title: "Gender",
                                widget: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          gender = "man";
                                        });
                                      },
                                      style: IconButton.styleFrom(
                                        backgroundColor: gender == "man"
                                            ? Colors.deepPurple
                                            : Colors.grey.shade200,
                                        fixedSize: const Size(50, 50),
                                      ),
                                      icon: Icon(
                                        Ionicons.male,
                                        color: gender == "man"
                                            ? Colors.white
                                            : Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          gender = "woman";
                                        });
                                      },
                                      style: IconButton.styleFrom(
                                        backgroundColor: gender == "woman"
                                            ? Colors.deepPurple
                                            : Colors.grey.shade200,
                                        fixedSize: const Size(50, 50),
                                      ),
                                      icon: Icon(
                                        Ionicons.female,
                                        color: gender == "woman"
                                            ? Colors.white
                                            : Colors.black,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Phone",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.lightBlueAccent),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(cubit.userModel!.phone!),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp,
                                          color: Colors.lightBlueAccent),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    Text(cubit.userModel!.email!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ));
          }),
    );
  }
}
