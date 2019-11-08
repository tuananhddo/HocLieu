import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class CustomCheckBox extends StatefulWidget {
//
//  final int id;
//  final Color checkBoxColor;
//  final Color tickedColor;
//  final Function changeCheckboxState;
//  final bool isChecked = false;
//
//  CustomCheckBox({Key key,this.checkBoxColor,this.tickedColor,this.id,this.changeCheckboxState})
//      : super(key: key);
//
//  @override
//  CustomCheckBoxState createState() => CustomCheckBoxState();
//}

Widget CustomCheckBox(id,tickedColor,checkBoxColor,isChecked,changeCheckboxState){

    return Theme(
      data: ThemeData(unselectedWidgetColor: checkBoxColor),
      child: Checkbox(
        value: isChecked,
        tristate: false,
        activeColor: checkBoxColor,
        checkColor: tickedColor,

        onChanged: (bool value) {
          changeCheckboxState(id);
        },
      ),
    );
}