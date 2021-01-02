import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/DEFINES.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Widgets/CardView.dart';

class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}



class ItemRegisterDialogBox extends StatefulWidget {
  //final String title, descriptions, text;
  //final Image img;
  final CardItemModel item;

  const ItemRegisterDialogBox({Key key, this.item}) : super(key: key);

  @override
  _ItemRegisterDialogBoxState createState() => _ItemRegisterDialogBoxState();
}

class _ItemRegisterDialogBoxState extends State<ItemRegisterDialogBox> {

  int _selectedBackgroundColorIdx = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context,null);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),

              //예시
              getExampleCardView(
                  this.widget.item.createdBy,
                  this.widget.item.contents,
                  _selectedBackgroundColorIdx
              ),

              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedBackgroundColorIdx = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 0 ? Border.all(color: Colors.black) : null,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: ITEM_COLOR_PALETTE.colorList[0]),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedBackgroundColorIdx = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 1 ? Border.all(color: Colors.black) : null,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: ITEM_COLOR_PALETTE.colorList[1]),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedBackgroundColorIdx = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 2 ? Border.all(color: Colors.black) : null,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: ITEM_COLOR_PALETTE.colorList[2]),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _selectedBackgroundColorIdx = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 3 ? Border.all(color: Colors.black) : null,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: ITEM_COLOR_PALETTE.colorList[3]),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              RaisedButton(
                onPressed: (){
                  //reqInsertDiaryToSvr();

                  Navigator.pop(context, _selectedBackgroundColorIdx);
                },
                color: Colors.black,
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
              ),

              SizedBox(height: 8)

            ],
          ),

        )
    );
  }

}