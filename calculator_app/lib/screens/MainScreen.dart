import 'package:calculator_app/cubit/calculator_cubit.dart';
import 'package:calculator_app/cubit/calculator_states.dart';
import 'package:calculator_app/widgets/ButtonsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000807),
      body: Column(
        children: [
            SizedBox(
            height: 55.h,
          ),
          SizedBox(
            height: 200.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                BlocBuilder<CalculatorCubit, CalculatorStates>(
                    builder: (context, state) {
                  if (state is PrintContentofButton) {
                    return Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          BlocProvider.of<CalculatorCubit>(context).screen,
                          style:  TextStyle(
                              fontSize: 55.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ));
                  } else if (state is CalculationProcess) {
                    return Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          BlocProvider.of<CalculatorCubit>(context).result,
                          style:  TextStyle(
                              fontSize: 55.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ));
                  } else if (state is DivisionByZero) {
                    return Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Division by zero is not allowed.',
                            style: TextStyle(
                                fontSize: 40.sp,
                                color: Colors.red[300],
                                fontWeight: FontWeight.bold),
                          )),
                    );
                  } else {
                    return const Text('');
                  }
                }),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ButtonsView(),
           SizedBox(
            height: 75.h,
          ),

        ],
      ),
    );
  }
}
