import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/DEFINES.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Util/Util.dart';
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
              getImagedCardView(this.widget.item),

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
                            this.widget.item.backgroundIdx = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 0 ? Border.all(color: Colors.black) : null,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              child: Image.asset(
                                "assets/imgs/card_background1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
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
                            this.widget.item.backgroundIdx = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 1 ? Border.all(color: Colors.black) : null,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              child: Image.asset(
                                "assets/imgs/card_background2.png",
                                fit: BoxFit.fill,
                              ),
                            ),
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
                            this.widget.item.backgroundIdx = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 2 ? Border.all(color: Colors.black) : null,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              child: Image.asset(
                                "assets/imgs/card_background3.png",
                                fit: BoxFit.fill,
                              ),
                            ),
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
                            this.widget.item.backgroundIdx = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _selectedBackgroundColorIdx == 3 ? Border.all(color: Colors.black) : null,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              child: Image.asset(
                                "assets/imgs/card_background4.png",
                                fit: BoxFit.fill,
                              ),
                            ),
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
                color: Color.fromARGB(255, 34, 34, 34),
                elevation: 5,
                child: Text(
                  "소원빌기",
                  style: GoogleFonts.nanumMyeongjo(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
              ),

              SizedBox(height: 8)

            ],
          ),

        )
    );
  }

}

class ShowItemPopup extends StatefulWidget {

  final CardItemModel item;
  const ShowItemPopup({Key key, this.item}) : super(key: key);

  @override
  _ShowItemPopupState createState() => _ShowItemPopupState();
}

class _ShowItemPopupState extends State<ShowItemPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),

            width: 220,
            height: 500,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 12, bottom: 8),
                  width: double.infinity,
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.close),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                getImagedCardView(this.widget.item),

                Container(
                  width: 200,
                  height: 100,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: getExampleCardView(this.widget.item.createdBy, this.widget.item.contents, this.widget.item.backgroundIdx),
                  ),
                ),

                SizedBox(
                  height: 28,
                ),

                RaisedButton(
                  onPressed: (){

                  },
                  color: Colors.black,
                  child: Text(
                    "소원빌기",
                    style: GoogleFonts.nanumMyeongjo(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                ),

                SizedBox(
                  height: 16,
                ),

              ],
            )
        )
    );
  }
}

class EmailRegisterPopup extends StatefulWidget {

  CardItemModel item;

  EmailRegisterPopup(CardItemModel item){
    this.item = item;
  }

  @override
  _EmailRegisterPopupState createState() => _EmailRegisterPopupState();
}

class _EmailRegisterPopupState extends State<EmailRegisterPopup> {

  TextEditingController _emailTextFieldController;
  bool _checkBoxChecked = false;

  @override
  void initState() {
    super.initState();

    _emailTextFieldController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          width: 1169,
          height: 388,
          child: Container(
            child: Container(
              width: 843,
              height: 288,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Text(
                    "이메일 주소를 알려주시면 코로나가 끝났을 때 알려드릴게요.",
                    style: GoogleFonts.nanumMyeongjo(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    width: 843,
                    child: TextField(
                      controller: _emailTextFieldController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(left: 18,top: 12,bottom: 12,right: 12),
                        hintText: "이름을 적어주세요",
                        counterText: "",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 198, 198, 198)
                        ),

                      ),
                      style:  GoogleFonts.nanumMyeongjo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: _checkBoxChecked, onChanged: (value){
                          setState(() {
                            _checkBoxChecked = value;
                          });

                        }),

                        Tooltip(
                          message: "개인정보 수집 및 이용에 대한 내용입니다.",
                          child: Text(
                            "개인정보 수집 및 이용",
                            style: GoogleFonts.nanumMyeongjo(
                                color: Colors.blue,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),

                        Text(
                          "에 동의합니다.",
                          style: GoogleFonts.nanumMyeongjo(
                              color: Colors.blue,
                              decoration: TextDecoration.underline
                          ),
                        )
                      ]
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      RaisedButton(
                        onPressed: (){

                          if(_emailTextFieldController.text.length == 0){
                            showToast("이메일을 입력해주세요.");
                          }else{
                            this.widget.item.email = _emailTextFieldController.text;

                            print("this.widget.item.email ${this.widget.item.email}");
                            print("this.widget.item.backgroundIdx ${this.widget.item.backgroundIdx}");
                            print("this.widget.item.createdBy ${this.widget.item.createdBy}");
                            print("this.widget.item.contents ${this.widget.item.contents}");
                            print("this.widget.item.createdAt ${this.widget.item.createdAt}");
                            Navigator.pop(context, this.widget.item);
                          }

                        },
                        color: Color.fromARGB(255, 34, 34, 34),
                        elevation: 5,
                        child: Text(
                          "등록하기",
                          style: GoogleFonts.nanumMyeongjo(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        padding: EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                      ),

                      CupertinoButton(
                          child: Text(
                            "아니오, 괜찮습니다.",
                            style: GoogleFonts.nanumMyeongjo(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          onPressed: (){
                              Navigator.pop(context);
                          }
                      )

                    ],
                  )



                ],
              ),
            ),
          ),

        )
    );
  }
}

