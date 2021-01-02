//하단의 그리드 뷰를 불러오는
import 'package:flutter/material.dart';

import '../DEFINES.dart';

getBottomCardView(String author, String contents) {

  return Container(
    padding: EdgeInsets.all(8),
    child: Container(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          //내용
          Container(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 6),
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Text(
              contents,
              style: TextStyle(
                  fontFamily: "NanumSquareRound",
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          //구분선
          Container(
            margin: EdgeInsets.all(12),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),

          //글쓴이
          Container(
            margin: EdgeInsets.only(left: 16, bottom:12),
            width: double.infinity,
            child: Text(
              "by " + author,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
              ),
            ),
          ),

        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
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
                style: TextStyle(
                    fontFamily: "NanumSquareRound",
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
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
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: ITEM_COLOR_PALETTE.colorList[colorIdx]),
      ),
    ),
  );
}