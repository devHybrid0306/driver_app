import 'package:flutter/material.dart';


class customTextField {
  static Widget buildTextField(
      {FormFieldSetter<String> onSaved = null,
        FormFieldValidator<String> validat = null,
        InputDecoration decor = null,
        textcolor = Colors.white,
        IconData data,
        String hint,
        bool obscure = false,
      control = null,
      text=''}) {
    return TextFormField(
      controller: control,

      style: TextStyle(color: textcolor,fontSize: 20.0),

      decoration: decor == null ? InputDecoration(
        hintText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),


      ) : decor,
      validator: validat,
      onSaved: onSaved,
      obscureText: obscure,


    );
  }
}

Widget verticalSizedBox(i,context){
  return SizedBox(
    height: MediaQuery.of(context).size.height * i / 100,
  );
}

Widget horizontalSizedBox(i,context){
  return SizedBox(
    width: MediaQuery.of(context).size.width * i / 100,
  );
}