import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/generated/l10n.dart';

class DivideScreen extends StatelessWidget {
  DivideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DivideCubit>(context);
    if (cubit.userModel == null) cubit.getUserData();
    return BlocConsumer<DivideCubit, DivideState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              "images/nn.webp",
              width: 50,
              height: 50,
            ),
            leadingWidth: 80,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.bottomNavIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            // type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNavIndex(index: index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: S.of(context).Favorites),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: S.of(context).Categories),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: S.of(context).Home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: S.of(context).Cart),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: S.of(context).Settings),
            ],
          ),
          body: cubit.DivideScreen[cubit.bottomNavIndex],
        );
      },
    );
  }
}
