import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/main.dart';
import 'package:shopping/src/shared/app_colors.dart';
import 'package:shopping/src/widget/shemmer_loading.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DivideCubit>(context);
    return Scaffold(
        body: BlocConsumer<DivideCubit, DivideState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Column(children: [
                  Expanded(
                      child: cubit.Cart.isNotEmpty
                          ? ListView.separated(
                              itemCount: cubit.Cart.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 12.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3)),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        cubit.Cart[index].image!,
                                        height: 100.h,
                                        width: 100.w,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(width: 12.5.h),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cubit.Cart[index].name!,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                    "${cubit.Cart[index].price!} \$"),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                if (cubit.Cart[index].price !=
                                                    cubit.Cart[index].oldPrice)
                                                  Text(
                                                    "${cubit.Cart[index].oldPrice!} \$",
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                    onPressed: () {
                                                      cubit
                                                          .addorRemoveFavorites(
                                                              productID: cubit
                                                                  .Cart[index]
                                                                  .id
                                                                  .toString());
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: cubit.favoritesID
                                                              .contains(cubit
                                                                  .Cart[index]
                                                                  .id
                                                                  .toString())
                                                          ? Colors.red
                                                          : Colors.grey,
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    cubit.addorRemoveCarts(
                                                        id: cubit.Cart[index].id
                                                            .toString());
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                          : Center(
                              child: CupertinoActivityIndicator(),
                            )),
                  Container(
                    child: Text(
                      "TotalPrice : ${cubit.totalPrice} \$",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: AppColors.Basic1),
                    ),
                  )
                ]),
              );
            }));
  }
}
