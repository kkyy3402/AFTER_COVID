import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox({Key key, this.title, this.descriptions, this.text, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),

              //예시
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              ),

              Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [

                    Container(
                      height: 30,
                      width: 80,
                      color: Colors.red,
                    ),

                    SizedBox(width: 8),

                    Container(
                      height: 30,
                      color: Colors.yellowAccent,
                    ),

                    SizedBox(width: 8),

                    Container(
                      height: 30,
                      color: Colors.blue,
                    )


                  ],
                ),
              ),

              RaisedButton(
                onPressed: (){

                },
                elevation: 0,
                color: Colors.yellowAccent,
                child: Text(
                  "공유하기",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NanumSquareRound",
                      fontWeight: FontWeight.bold

                  ),
                ),
                padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
              )

            ],
          ),

        )
    );
  }

}