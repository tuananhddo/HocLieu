import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomButton extends StatefulWidget{

  final String title;
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final Widget renderringWidget;
  BottomButton({Key key, this.title: "",this.height,this.width,this.color,this.icon,this.renderringWidget})
      : super(key: key);

  @override
  BottomButtonState createState() => BottomButtonState();
}
class BottomButtonState extends State<BottomButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.renderringWidget),
        );
      },
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              color: widget.color,
              borderRadius: new BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 10.0, // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                )
              ]
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(widget.icon),
                Text(widget.title),

              ],
            ),
          ),

        ),
      )
      ,
    );

  }
}