import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomItemMenuButtonWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final String path;
  final Color backgroundColor;
  final Color splashColor;
  final Function() action;

  const CustomItemMenuButtonWidget(
      {Key? key,
      required this.title,
      required this.path,
      required this.backgroundColor,
      required this.titleColor,
      required this.splashColor,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: backgroundColor, onPrimary: splashColor),
        onPressed: action,
        child: Container(
          width: 150,
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: 80,
                height: 80,
                image: AssetImage(
                  path,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: mainTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor),
              )
            ],
          ),
        ));
  }
}
