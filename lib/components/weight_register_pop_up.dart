import 'package:flutter/material.dart';

class WeightRegisterPopUp extends StatelessWidget {
  const WeightRegisterPopUp(
      this.saveWeight, this.saveComment, this.registerOnTap);

  final Function saveWeight;
  final Function saveComment;
  final Function registerOnTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("今日の体重を入力しよう"),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 24,
      ),
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.only(left: 4),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '嘘つくなよ',
                  labelText: '今日の体重',
                ),
                onChanged: (value) {
                  saveWeight(value);
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10.0),
            Text('kg')
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: 200,
          padding: EdgeInsets.only(left: 4),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '後悔先に立たず',
              labelText: '懺悔の一言',
            ),
            onChanged: (value) {
              saveComment(value);
            },
            keyboardType: TextInputType.text,
          ),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context),
          child: RaisedButton(
            child: Text(
              "登録",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              registerOnTap();
            },
          ),
        ),
      ],
    );
  }
}
