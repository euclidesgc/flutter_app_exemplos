import 'package:components/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


import '../hexa_color.dart';

class BotaoPadrao extends StatefulWidget {
  final Function onPressed;
  final bool isLoading;
  final String textButton;
  final Icon icon;
  final Color textColor;
  final Color colorIcon;

  final double width;

  const BotaoPadrao({
    Key key,
    this.onPressed,
    @required this.textButton,
    this.icon,
    this.colorIcon,
    this.textColor = Colors.black,
    this.isLoading = false,
    this.width
  }) : super(key: key);

  @override
  _BotaoPadraoState createState() => _BotaoPadraoState();
}

class _BotaoPadraoState extends State<BotaoPadrao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: widget.width,
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: widget.onPressed == null
                    ? Theme.of(context).primaryColor.withOpacity(0.7)
                    : Colors.transparent),
            borderRadius: new BorderRadius.circular(30.0),
          ),
          fillColor: widget.isLoading
              ? primaryColorMaterial[100]
              : (widget.onPressed != null
                  ? Theme.of(context).primaryColor
                  : primaryColorMaterial[100]),
          splashColor: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.icon != null ? widget.icon : Container(),
              Text(
                widget.textButton,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: widget.onPressed == null ? Colors.white : Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          onPressed: widget.isLoading ? null : widget.onPressed,
        ),
      ),
    );
  }
}
