import 'package:components/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


import '../hexa_color.dart';

class BotaoPadraoAnimado extends StatefulWidget {
  final Function onPressed;
  final bool isLoading;
  final String textButton;
  final Icon icon;
  final Color textColor;
  final Color colorIcon;

  final Animation<double> animation;

  const BotaoPadraoAnimado(
      {Key key,
      this.onPressed,
      @required this.textButton,
      this.icon,
      this.colorIcon,
      this.textColor = Colors.black,
      this.isLoading,
      this.animation})
      : super(key: key);

  @override
  _BotaoPadraoAnimadoState createState() => _BotaoPadraoAnimadoState();
}

class _BotaoPadraoAnimadoState extends State<BotaoPadraoAnimado>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (BuildContext context, Widget child) {
        return Center(
          child: Container(
            height: 60,
            width: widget.animation.value,
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
                  widget.animation.value > 80
                      ? Text(
                          widget.textButton,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: widget.onPressed == null
                                ? Colors.white
                                : Colors.white,
                            fontSize: 18,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        ),
                ],
              ),
              onPressed: widget.isLoading ? null : widget.onPressed,
            ),
          ),
        );
      },
    );
  }
}
