import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Divide/divide_cubit/cubit/divide_cubit.dart';
import 'package:shopping/src/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> categores = BlocProvider.of<DivideCubit>(context)
        .getCategoriesData() as List<CategoriesModel>;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: GridView.builder(
          itemCount: categores.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      categores[index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(categores[index].name!)
                ],
              ),
            );
          }),
    ));
  }
}
