import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key key,
    @required this.registerOnTap,
  }) : super(key: key);

  final Function registerOnTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: () => Navigator.pop(context),
      child: RaisedButton(
        child: Text(
          "再登録",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
        shape: StadiumBorder(),
        onPressed: () {
          registerOnTap();
        },
      ),
    );
  }
}
