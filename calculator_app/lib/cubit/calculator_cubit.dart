import 'package:calculator_app/cubit/calculator_states.dart';
import 'package:calculator_app/models/ButtonModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expressions/expressions.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(InitialState());
  String screen = "";
  String temp = "";
  late String result = '';
  printOnScreen({required ButtonModel buttonModel}) {
    if (buttonModel.content != '=') {
      if (screen == "") {
        if (buttonModel.content != 'del' &&
            buttonModel.content != 'c' &&
            buttonModel.content != '-' &&
            buttonModel.content != '%' &&
            buttonModel.content != '+' &&
            buttonModel.content != 'ـــ' &&
            buttonModel.content != 'x' &&
            buttonModel.content != '/' &&
            buttonModel.content != '.') {
          screen += buttonModel.content;
          temp += buttonModel.content;
        }
      } else if (buttonModel.content == 'c') {
        screen = "";
        temp = "";
      } else if (screen != "") {
        if (buttonModel.content == 'ـــ') {
          screen += '-';
          temp += '-';
        } else if (buttonModel.content == 'x') {
          screen += 'x';
          temp += '*';
        } else if (buttonModel.content == 'del') {
          String modified = screen.substring(0, screen.length - 1);
          temp = modified;
          screen = modified;
        } else if (buttonModel.content != '=') {
          if (buttonModel.content == 'c') {
            screen = "";
            temp = "";
          } else {
            screen += buttonModel.content;
            temp += buttonModel.content;
          }
        }
      }
    }
    emit(PrintContentofButton());
  }

  calculatorProcess() {
    bool f = false;
    bool f2 =false;
    if (temp.isNotEmpty) {
      for (int i = 0; i < temp.length; i++) {
        if (temp[i] == '/' && temp[i + 1] == '0') {
          emit(DivisionByZero());
          screen = '';
          temp = '';

          f = true;
          break;
        }


      }
      if (f == false) {
        if (temp[temp.length - 1] != '%' &&
            temp[temp.length - 1] != '+' &&
            temp[temp.length - 1] != '-' &&
            temp[temp.length - 1] != '*' &&
            temp[temp.length - 1] != '/' &&
            temp[temp.length - 1] != '.' ) {
          Expression expression = Expression.parse(temp);
          final evaluator = const ExpressionEvaluator();
          var r = evaluator.eval(expression, {});
          result = r.toString();
          screen = r.toString();
          temp = r.toString();

          emit(CalculationProcess());
        }
        ;
        print(temp);
      }
    }
  }
}
