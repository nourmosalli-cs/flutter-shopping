import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Search,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 7.5, horizontal: 12),
                  prefixIcon: const Icon(Icons.search),
                  hintText: S.of(context).Search,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          SizedBox(height: 10.h),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fixedSize: Size(60, 50),
              elevation: 3,
            ),
            icon: const Icon(Ionicons.search, color: Colors.white),
          ),
          SizedBox(
            width: 2.w,
          ),
        ],
      ),
    );
  }
}
