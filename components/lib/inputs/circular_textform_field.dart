import 'package:flutter/material.dart';

class CircularTextFormField extends StatelessWidget {
  final Widget prefixIcon;

  final Widget sufixIcon;

  final String hintText;

  final bool obscure;

  final Function(String) onChange;



  const CircularTextFormField({Key key,@required this.hintText,this.prefixIcon, this.sufixIcon, this.obscure = false, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: Colors.white.withOpacity(0.6),
        border: Border.all(
          width: 1,
          color: Theme.of(context).primaryColor//                   <--- border width here
        ),
      ),
      child: TextFormField(
        onChanged: (text){
          onChange(text);
        },
        obscureText: obscure,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffix: sufixIcon,
            border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              //borderSide: const BorderSide(),
            ),
            hintStyle: Theme.of(context).textTheme.headline3,
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText),
      ),
    );
  }
}
