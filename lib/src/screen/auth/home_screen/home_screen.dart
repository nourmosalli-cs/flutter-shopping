import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/models/home_model.dart';
import 'package:shopping/src/shared/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DivideCubit>(context);
    return BlocConsumer<DivideCubit, DivideState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  TextFormField(
                    onChanged: (input) {
                      cubit.filterHome(input: input);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 7.5.dg,
                        horizontal: 12.h,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: S.of(context).Search,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  cubit.banners.isEmpty
                      ? const Center(child: CupertinoActivityIndicator())
                      : SizedBox(
                          height: 125.h,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: pageController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Image.network(
                                  cubit.banners[index].image!,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 6,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 25,
                          dotWidth: 16,
                          dotHeight: 16.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.indigo),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).Categories,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  cubit.categores.isEmpty
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : SizedBox(
                          height: 70.h,
                          width: double.infinity,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: cubit.categores.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 15.w,
                                );
                              },
                              itemBuilder: (context, index) {
                                return CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      cubit.categores[index].image!),
                                );
                              }),
                        ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).Home,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  cubit.home.isEmpty
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : GridView.builder(
                          itemCount: cubit.filteredHome.isEmpty
                              ? cubit.home.length
                              : cubit.filteredHome.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            return _homeitem(
                                model: cubit.filteredHome.isEmpty
                                    ? cubit.home[index]
                                    : cubit.filteredHome[index],
                                cubit: cubit);
                          }),
                ],
              ),
            ),
          );
        });
  }
}

Widget _homeitem({required HomeModel model, required DivideCubit cubit}) {
  return Container(
    color: Colors.grey.withOpacity(0.3),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Column(
      children: [
        Expanded(
          child: Image.network(
            model.image!,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          model.name!,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              color: Colors.blue),
        ),
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Text(
                  "${model.price!}\$",
                  style: TextStyle(fontSize: 13.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "${model.oldPrice!}\$",
                  style: TextStyle(
                      fontSize: 13.sp, decoration: TextDecoration.lineThrough),
                ),
              ],
            )),
            GestureDetector(
              child: Icon(Icons.favorite,
                  size: 20.sp,
                  color: cubit.favoritesID.contains(model.id.toString())
                      ? Colors.red
                      : Colors.grey),
              onTap: () {
                cubit.addorRemoveFavorites(productID: model.id.toString());
              },
            ),
          ],
        ),
      ],
    ),
  );
}
