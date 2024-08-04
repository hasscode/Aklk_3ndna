import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildMealCartItem(MealModel model, context) => Favorite(model: model);

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
    required this.model,
  });
  final MealModel model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Dismissible(
          key: Key(model.name!),
          onDismissed: (direction) {
            cubit.deleteMealsFromTheCart(
              name: model.name!,
              price: model.price!,
              description: model.description!,
              photo: model.photo!,
              rate: model.rate!,
              isLiked: false,
            );
            showToast(
                msg: 'تم إزالة ${model.name!} من سلة الشراء',
                color: Colors.red);
          },
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: const Color(0xffFFFEEE),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(model.photo!),
              ),
              title: Text(
                model.name!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${model.price!}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),
            ),
          ),
        );
      },
    );
  }
}
