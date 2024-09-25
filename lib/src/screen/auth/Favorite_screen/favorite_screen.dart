import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:shopping/main.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DivideCubit>(context);
    return BlocConsumer<DivideCubit, DivideState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
          child: Column(
            children: [
              TextFormField(
                onChanged: (input) {
                  cubit.filterHome(input: input);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 7.5,
                    horizontal: 12,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: S.of(context).Search,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 38),
              Expanded(
                child: ListView.builder(
                    itemCount: cubit.favorites.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.dg, horizontal: 12.5.h),
                        child: Row(
                          children: [
                            Image.network(
                              cubit.favorites[index].image!,
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    cubit.favorites[index].name!,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${cubit.favorites[index].price!} \$"),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "${cubit.favorites[index].oldPrice!} \$",
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.addorRemoveFavorites(
                                            productID: cubit.favorites[index].id
                                                .toString());
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                  // MaterialButton(
                                  //   onPressed: () {
                                  //     // add | remove
                                  //     cubit.addOrRemoveFromFavorites(
                                  //         productID: cubit.favorites[index].id
                                  //             .toString());
                                  //   },
                                  //   child: Text("Remove"),
                                  //   textColor: Colors.white,
                                  //   shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(25)),
                                  //   color: Colors.grey,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
      },
    );
  }
}
