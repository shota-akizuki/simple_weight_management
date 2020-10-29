import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
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
          "削除する",
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.lightBlue,
        shape: StadiumBorder(),
        onPressed: () {
          registerOnTap();
        },
      ),
    );
  }
}
