import 'package:calculator_app/cubit/calculator_cubit.dart';
import 'package:calculator_app/models/ButtonModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonModel});
  ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: const Color(0xffC1EEEA),
      onTap: () {
        if (buttonModel.content == '=') {
          BlocProvider.of<CalculatorCubit>(context).calculatorProcess();
        } else {
          BlocProvider.of<CalculatorCubit>(context)
              .printOnScreen(buttonModel: buttonModel);
        }
      },
      child: Container(
        width: 103.w,
        height: 100.h,
        child: Card(
          color: buttonModel.color,
          child: Center(
              child: Text(
            buttonModel.content,
            style:   TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42.sp,
                color: Colors.white,
                fontFamily: 'MartelSans'),
          )),
        ),
      ),
    );
  }
}
