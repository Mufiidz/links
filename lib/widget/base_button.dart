import 'package:flutter/material.dart';

import '../res/export_res.dart';

class BaseButton extends StatefulWidget {
  final Function()? onClick;
  final String text;
  final double? height;
  const BaseButton(
      {Key? key, this.onClick, required this.text, this.height = 40})
      : super(key: key);

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onClick,
        onHover: (value) => setState(() {
          isHover = value;
        }),
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.navyBlue,
            foregroundColor: Colors.white,
            elevation: isHover ? 20 : 10,
            shadowColor: MyColors.navyBlueShadow.withOpacity(0.9)),
        child: Text(widget.text),
      ),
    );
  }
}
