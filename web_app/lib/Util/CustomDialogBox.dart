import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/DEFINES.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Util/Util.dart';
import 'package:web_app/Widgets/CardView.dart';
import 'dart:convert';
import 'dart:convert' show utf8, base64;

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
          width: 360,
          padding: EdgeInsets.all(24),
          height: 400,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [

                Container(
                  padding: EdgeInsets.only(left: 32),
                  width: double.infinity,
                  child: Text(
                    "이메일 주소를\n알려주실 수 있으세요?",
                    style: GoogleFonts.nanumMyeongjo(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),

                SizedBox(
                    height: 16
                ),

                Container(
                  padding: EdgeInsets.only(left: 32),
                  width: double.infinity,
                  child: Text(
                    "코로나가 끝나는대로\n좋은 소식을 전해드릴께요 :)",
                    style: GoogleFonts.nanumMyeongjo(
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(
                  height: 24,
                ),

                Container(
                  width: 270,
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
                      hintText: "이메일을 적어주세요.",
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(value: _checkBoxChecked, onChanged: (value){
                        setState(() {
                          _checkBoxChecked = value;
                        });

                      }),

                      InkWell(
                        onTap: (){
                          launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                        },
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
                          color: Colors.black,
                        ),
                      )

                    ]
                ),

                SizedBox(
                  height: 16,
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    RaisedButton(
                      onPressed: (){

                        if(!_checkBoxChecked){
                          showToast("동의해주셔야 가능합니다 ^_^ ");
                          return;
                        }

                        if(_emailTextFieldController.text.length == 0){
                          showToast("이메일을 입력해주세요.");
                        }else{

                          final encodedEmail = base64.encode(utf8.encode(_emailTextFieldController.text));
                          this.widget.item.email = encodedEmail;

                          final decoded = utf8.decode(base64.decode(encodedEmail));
                          print("decoded : $decoded");
                          print("decoded : $decoded");

                          print("this.widget.item.email ${this.widget.item.email}");
                          print("this.widget.item.backgroundIdx ${this.widget.item.backgroundIdx}");
                          print("this.widget.item.createdBy ${this.widget.item.createdBy}");
                          print("this.widget.item.contents ${this.widget.item.contents}");
                          print("this.widget.item.createdAt ${this.widget.item.createdAt}");
                          Navigator.pop(context, this.widget.item);
                        }

                      },
                      color: _checkBoxChecked ? Color.fromARGB(255, 34, 34, 34) : Colors.grey,
                      elevation: 5,
                      child: Text(
                        "등록하기",
                        style: GoogleFonts.nanumMyeongjo(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                    ),

                    CupertinoButton(
                        child: Text(
                          "아니오, 괜찮습니다.",
                          style: GoogleFonts.nanumMyeongjo(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
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

        )
    );
  }
}

