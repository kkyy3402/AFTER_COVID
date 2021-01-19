//하단의 그리드 뷰를 불러오는
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/Widgets/ShowContentsPopup.dart';

import '../DEFINES.dart';
import '../Models/CardItemModel.dart';
import 'package:vector_math/vector_math.dart' as math;


getImagedCardView(CardItemModel cardItem, BuildContext context) {

  return GestureDetector(
    onTap: (){

      showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: ShowContentPopup(item: cardItem)
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {});

    },
    child: Container(
      alignment: Alignment.center,
      child: Stack(
        children: [

          Container(
            width: 200,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/imgs/card_background${cardItem.backgroundIdx+1}.png",
                    )
                )
            ),
          ),

          Container(
            width: 188,
            height: 200,
            margin: EdgeInsets.only(left: 6,top: 16,right: 6),
            child: Container(
              margin: EdgeInsets.only(left: 16,top: 16,right: 16),
              padding: EdgeInsets.only(left: 16,top: 16,right: 16),
              child: Column(
                children: [

                  Expanded(
                      child: Container(
                        child: Text(
                          cardItem.contents,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nanumMyeongjo(
                            fontSize: 12 ,
                            fontWeight: FontWeight.w100,
                          )
                        ),
                        width: double.infinity,
                      )
                  ),

                  Divider(
                    height: 1,
                  ),

                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      margin:EdgeInsets.only(bottom: 16,right: 8, top: 16),
                      child: Text(
                        "by. " + cardItem.createdBy,
                        style: GoogleFonts.nanumMyeongjo(
                            fontSize: 12
                        )
                      )
                  )

                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    ),
  );
}

getExampleCardView(String author, String contents, int colorIdx) {

  return Container(
    child: Container(
      width: 200,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          //내용
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 6),
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Text(
                  contents,
                  style: GoogleFonts.nanumMyeongjo(
                      color: Colors.black
                  )
              ),
            ),
          ),

          SizedBox(height: 16),


          //글쓴이
          Container(
            margin: EdgeInsets.only(left: 16, bottom:12),
            width: double.infinity,
            child: Text(
              "by " + author,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,

              ),
            ),
          ),

        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white
      ),
    ),
  );
}