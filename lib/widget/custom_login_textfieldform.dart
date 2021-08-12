import 'package:flutter/material.dart';

class CustomLoginTextFieldWidget extends StatelessWidget {
  final Color color;
  final String hintText;
  final double width;
  final double height;
  final EdgeInsets margin;
  final bool obscureText;
  final IconData icon;
  final TextEditingController controller;

  const CustomLoginTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.color,
      required this.hintText,
      required this.width,
      required this.height,
      required this.margin,
      required this.obscureText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(2, 3)),
          ]),
      margin: margin,
      width: width,
      height: height,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(icon, color: color),
          ),
          VerticalDivider(
            color: color,
            thickness: 1.5,
            width: 1,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          new Flexible(
              child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            // style: textFieldStyle,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              hintText: hintText,
              // hintStyle: textFieldStyle,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0))),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(0), width: 0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class CustomLoginPasswordTexFieldWidget extends StatefulWidget {
  final Color color;
  final String hintText;
  final double width;
  final double height;
  final EdgeInsets margin;
  final bool obscureText;
  final IconData icon;
  final TextEditingController controller;

  const CustomLoginPasswordTexFieldWidget(
      {Key? key,
      required this.controller,
      required this.color,
      required this.hintText,
      required this.width,
      required this.height,
      required this.margin,
      required this.obscureText,
      required this.icon})
      : super(key: key);

  @override
  _CustomLoginPasswordTexFieldWidgetState createState() =>
      _CustomLoginPasswordTexFieldWidgetState();
}

class _CustomLoginPasswordTexFieldWidgetState
    extends State<CustomLoginPasswordTexFieldWidget> {
  bool _passwordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(2, 3)),
          ]),
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(widget.icon, color: widget.color),
          ),
          VerticalDivider(
            color: widget.color,
            thickness: 1.5,
            width: 1,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          new Flexible(
              child: TextFormField(
            controller: widget.controller,
            obscureText: _passwordVisible,
            // style: textFieldStyle,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
              hintText: widget.hintText,
              // hintStyle: textFieldStyle,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0))),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.white.withOpacity(0), width: 0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
