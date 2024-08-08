import 'package:flutter/material.dart';
import '../models/ButtonModel.dart';
import 'Custombutton.dart';

class ButtonsView extends StatelessWidget {
  ButtonsView({super.key});
  List<ButtonModel> buttons = [
    ButtonModel(content: 'c', color: const Color(0xff040E0F)),
    ButtonModel(content: 'del', color: const Color(0xff061114)),
    ButtonModel(content: '%', color: const Color(0xff09151B)),
    ButtonModel(content: '+', color: const Color(0xff0C4043)),
    ButtonModel(content: '1', color: const Color(0xff040E0F)),
    ButtonModel(content: '2', color: const Color(0xff061114)),
    ButtonModel(content: '3', color: const Color(0xff09151B)),
    ButtonModel(content: 'ـــ', color: const Color(0xff0C4043)),
    ButtonModel(content: '4', color: const Color(0xff040E0F)),
    ButtonModel(content: '5', color: const Color(0xff061114)),
    ButtonModel(content: '6', color: const Color(0xff09151B)),
    ButtonModel(content: 'x', color: const Color(0xff0C4043)),
    ButtonModel(content: '7', color: const Color(0xff040E0F)),
    ButtonModel(content: '8', color: const Color(0xff061114)),
    ButtonModel(content: '9', color: const Color(0xff09151B)),
    ButtonModel(content: '/', color: const Color(0xff0C4043)),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, i) {
              return CustomButton(
                buttonModel: buttons[i],
              );
            }),
        Row(
          children: [
            CustomButton(
              buttonModel: ButtonModel(content: '0', color: const Color(0xff040E0F)),
            ),
            CustomButton(
              buttonModel: ButtonModel(content: '.', color: const Color(0xff061114)),
            ),
            Expanded(
                child: CustomButton(
              buttonModel: ButtonModel(content: '=', color: const Color(0xff29B1A4)),
            )),
          ],
        )
      ],
    );
  }
}
