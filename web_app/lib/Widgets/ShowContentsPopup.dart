import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Util/Util.dart';

import 'CardView.dart';

class ShowContentPopup extends StatefulWidget {
  //final String title, descriptions, text;
  //final Image img;
  final CardItemModel item;

  const ShowContentPopup({Key key, this.item}) : super(key: key);

  @override
  _ShowContentPopupState createState() => _ShowContentPopupState();
}

class _ShowContentPopupState extends State<ShowContentPopup> {

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
              getImagedCardView(this.widget.item, context),

              SizedBox(height: 24),

              RaisedButton(
                onPressed: (){
                  //reqInsertDiaryToSvr();
                  //Navigator.pop(context, _selectedBackgroundColorIdx);

                  showToast("빌리 주소가 클립보드에 복사되었습니다.");

                  Clipboard.setData(ClipboardData(text: "http://27.96.131.187")



                  ).then((_){

                  }
                  );

                },
                color: Color.fromARGB(255, 34, 34, 34),
                elevation: 5,
                child: Text(
                  "공유하기",
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