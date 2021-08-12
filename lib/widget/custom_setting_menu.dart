import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomSettingDrawerMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() action;
  const CustomSettingDrawerMenuWidget(
      this.icon, this.title, this.isSelected, this.action,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Color(0xffD2D3D5) : kMainBackgroundColor),
      height: 50,
      child: TextButton(
          style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Color(0xffd0d0d0))),
          onPressed: action,
          child: Row(
            children: [
              Icon(
                icon,
                size: 26,
              ),
              SizedBox(width: 10),
              Text(title,
                  style: mainTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlueColor,
                  ))
            ],
          )),
    );
  }
}
