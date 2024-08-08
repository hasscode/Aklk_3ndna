import 'package:calculator_app/cubit/calculator_cubit.dart';
import 'package:calculator_app/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp( CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
   CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize:  Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return BlocProvider(
          create: (context)=>CalculatorCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',

            home: child,
          ),
        );
      },
      child:  MainScreen(),
    );
  }
}
