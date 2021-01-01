import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_app/Managers/NetworkManager.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Util/AnimatedFlipCounter.dart';

class USER_AGENT_TYPE{
  static String APPLE = "apple";
  static String ANDROID = "android";
  static String DESKTOP = "desktop";
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<CardItemModel> cardItemList = <CardItemModel>[];
  int _testCnt = 0;

  TextEditingController _contentTextEditingController;
  TextEditingController _authorTextEditingController;

  //Timer _timerForCounter;

  //User-Agent체크를 위한 변수들
  final String appleType = "apple";
  final String androidType = "android";
  final String desktopType = "desktop";

  @override
  void initState() {
    super.initState();

    _contentTextEditingController = TextEditingController();
    _authorTextEditingController = TextEditingController();
    getItemInfosFromSvr();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Container(
              child: Column(
                children: [

                  getTopView(),
                  getBottomView(),

                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey.shade200,
                  ),

                  getFooter()



                ],
              )
          ),
        ),
      ),
    );
  }

  Widget getTopView() {
    return Stack(
      children: [

        Container(
          height: 300,
          width: double.infinity,
          child: Image.asset(
            "assets/imgs/top_bg.png",
            fit: BoxFit.fill,
          ),
        ),

        Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 300,
            child: Stack(
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    SizedBox(
                      height: 15,
                    ),

                    RichText(
                      //maxLines: 1,
                      softWrap: false,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '😷 코로나',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '가 끝나면 나는 당장',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,)),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Container(
                        width: 300,
                        child: CupertinoTextField(
                          controller: _contentTextEditingController,
                          placeholder: "하고싶은 일을 적어주세요",
                          padding: EdgeInsets.all(12),
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "NanumSquareRound"
                          ),
                        )

                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(width: 15),

                        Container(
                          width: 150,
                          child: CupertinoTextField(
                            controller: _authorTextEditingController,
                            placeholder: "이름을 적어주세요",
                            padding: EdgeInsets.all(12),
                            style: TextStyle(
                                fontFamily: "NanumSquareRound",
                                fontSize: 14
                            ),
                          ),
                        ),

                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    RaisedButton(
                      onPressed: (){
                        reqInsertDiaryToSvr();
                      },
                      color: Colors.black,
                      child: Text(
                        "소원빌기",
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

              ],
            )
        ),


        Container(
          color: Colors.black45,
          height: 36,
          child: Row(
            children: [

              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "💰BILLI",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "NanumSquareRound",
                        fontWeight: FontWeight.bold

                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  alignment: Alignment.center,
                  child: Text(
                    "After Covid-19",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Container(

                ),
              ),

            ],
          ),
        ),

      ],
    );
  }

  getBottomView() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          SizedBox(height: 32),

          AnimatedFlipCounter(
            duration: Duration(milliseconds: 500),
            value: cardItemList.length, /* pass in a number like 2014 */
            color: Colors.black,
            size: 50,
          ),

          SizedBox(height: 8),

          Text(
            "개의 소망이 모여",
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          SizedBox(height: 8),

          Text(
            "애프터 코로나를 기원합니다.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          SizedBox(
            height: 16,
          ),

          getMessageCards()






          /*
          Container(
            height: 300,
            child: GridView.count(
              crossAxisCount: 4 ,
              children: List.generate(50,(index){
                return getBottomCardView("kkyy3402","ㅁㄴ아러ㅗㅁ너ㅏㅇ롸먼ㅇ롬ㄴㅇㅀ롬ㄴㅇㅎ러ㅗㅁㄶ럼ㄴㅇㅎ렇ㄴㅁㅇ롷ㄴ엃ㅁㄴㅀㅁㄴㅀ넘ㄹ허ㅗㄴㅇㅎ렇ㅁ농렇ㅁ넗ㅁㄴ엃ㅁㄴㅀㅁㄴㅀㅁㄴ러ㅗㅁㄴㅇ라ㅓㅗㅁ낭로ㅓㅗ허ㅗ홓ㄻ놓ㅇㄹㅁㄴㅇ롬넝롬ㄴ아롸ㅓㅁㄴ오러ㅏㅁ놀어ㅏㅗㅁㄴㄻㄴㅀㅁㄶㅁㄴ옮ㄴㅀㄶㅁ넣렇");
              }),
            ),
          )

           */




/*
          StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.green,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('$index'),
                  ),
                )),
            staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )

*/

        ],
      ),
    );
  }

  //하단의 그리드 뷰를 불러오는
  getBottomCardView(String author, String contents) {

    return Container(
      padding: EdgeInsets.all(30),
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

  void makeDefaultItemList() {
    for (int i = 0 ; i < 3 ; i++) {
      cardItemList.add(CardItemModel(contents: "내용${i}", createdBy: "글쓴이${i}",createdAt: "${i}"));
    }

  }

  getFooter() {
    return Container(
      decoration: BoxDecoration(

      ),
      width: double.infinity,
      alignment: Alignment.center,
      height: 50,
      child: Text("Copyright 2021. Team BILLI All right reserved"),
    );
  }

  String getUserAgent(){
    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if( userAgent.contains("iphone"))  return appleType;
    if( userAgent.contains("android"))  return androidType;

    // tablet
    if( userAgent.contains("ipad")) return appleType;
    if( html.window.navigator.platform.toLowerCase().contains("macintel") && html.window.navigator.maxTouchPoints > 0 ) return appleType;

    return desktopType;
  }

  getMessageCards() {

    int columnCnt = 2;
    double screenWidth = MediaQuery.of(context).size.width;

    //반응형 대응
    if(screenWidth > 0 && screenWidth < 300){
      columnCnt = 1;
    }else if(screenWidth >= 300 && screenWidth < 540){
      columnCnt = 1;
    }else if(screenWidth >= 540 && screenWidth < 870){
      columnCnt = 2;
    }else if(screenWidth >= 870 && screenWidth < 1100){
      columnCnt = 3;
    }else if(screenWidth >= 1100 && screenWidth < 1450){
      columnCnt = 4;
    }else{
      columnCnt = 5;
    }

    print("width : $screenWidth");

    //User-Agent에 따라, 화면에 표출되는 Column 카운트를 변경시킨다.
    if(getUserAgent() == USER_AGENT_TYPE.ANDROID || getUserAgent() == USER_AGENT_TYPE.APPLE){
      columnCnt = 1;
    }

    return Column(
      children: [
        for (int columnIdx = 0 ; columnIdx < cardItemList.length / columnCnt ; columnIdx++)
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int rowCnt = 0 ; rowCnt < columnCnt ; rowCnt++)
                  cardItemList.length > columnIdx * columnCnt + rowCnt?
                    getBottomCardView(
                        "${cardItemList[columnIdx * columnCnt + rowCnt].createdBy}",
                        "${cardItemList[columnIdx * columnCnt + rowCnt].contents}") : Container()

              ]),

        /*
          Row(
              children: [
                getBottomCardView("kkyy3402","ㅁㄴ아러ㅗㅁ너ㅏㅇ롸먼ㅇ롬ㄴㅇㅀ롬ㄴㅇㅎ러ㅗㅁㄶ럼ㄴㅇㅎ렇ㄴㅁㅇ롷ㄴ엃ㅁㄴㅀㅁㄴㅀ넘ㄹ허ㅗㄴㅇㅎ렇ㅁ농렇ㅁ넗ㅁㄴ엃ㅁㄴㅀㅁㄴㅀㅁㄴ러ㅗㅁㄴㅇ라ㅓㅗㅁ낭로ㅓㅗ허ㅗ홓ㄻ놓ㅇㄹㅁㄴㅇ롬넝롬ㄴ아롸ㅓㅁㄴ오러ㅏㅁ놀어ㅏㅗㅁㄴㄻㄴㅀㅁㄶㅁㄴ옮ㄴㅀㄶㅁ넣렇"),
                getBottomCardView("kkyy3402","ㅁㄴ아러ㅗㅁ너ㅏㅇ롸먼ㅇ롬ㄴㅇㅀ롬ㄴㅇㅎ러ㅗㅁㄶ럼ㄴㅇㅎ렇ㄴㅁㅇ롷ㄴ엃ㅁㄴㅀㅁㄴㅀ넘ㄹ허ㅗㄴㅇㅎ렇ㅁ농렇ㅁ넗ㅁㄴ엃ㅁㄴㅀㅁㄴㅀㅁㄴ러ㅗㅁㄴㅇ라ㅓㅗㅁ낭로ㅓㅗ허ㅗ홓ㄻ놓ㅇㄹㅁㄴㅇ롬넝롬ㄴ아롸ㅓㅁㄴ오러ㅏㅁ놀어ㅏㅗㅁㄴㄻㄴㅀㅁㄶㅁㄴ옮ㄴㅀㄶㅁ넣렇"),
                getBottomCardView("kkyy3402","ㅁㄴ아러ㅗㅁ너ㅏㅇ롸먼ㅇ롬ㄴㅇㅀ롬ㄴㅇㅎ러ㅗㅁㄶ럼ㄴㅇㅎ렇ㄴㅁㅇ롷ㄴ엃ㅁㄴㅀㅁㄴㅀ넘ㄹ허ㅗㄴㅇㅎ렇ㅁ농렇ㅁ넗ㅁㄴ엃ㅁㄴㅀㅁㄴㅀㅁㄴ러ㅗㅁㄴㅇ라ㅓㅗㅁ낭로ㅓㅗ허ㅗ홓ㄻ놓ㅇㄹㅁㄴㅇ롬넝롬ㄴ아롸ㅓㅁㄴ오러ㅏㅁ놀어ㅏㅗㅁㄴㄻㄴㅀㅁㄶㅁㄴ옮ㄴㅀㄶㅁ넣렇"),
                getBottomCardView("kkyy3402","ㅁㄴ아러ㅗㅁ너ㅏㅇ롸먼ㅇ롬ㄴㅇㅀ롬ㄴㅇㅎ러ㅗㅁㄶ럼ㄴㅇㅎ렇ㄴㅁㅇ롷ㄴ엃ㅁㄴㅀㅁㄴㅀ넘ㄹ허ㅗㄴㅇㅎ렇ㅁ농렇ㅁ넗ㅁㄴ엃ㅁㄴㅀㅁㄴㅀㅁㄴ러ㅗㅁㄴㅇ라ㅓㅗㅁ낭로ㅓㅗ허ㅗ홓ㄻ놓ㅇㄹㅁㄴㅇ롬넝롬ㄴ아롸ㅓㅁㄴ오러ㅏㅁ놀어ㅏㅗㅁㄴㄻㄴㅀㅁㄶㅁㄴ옮ㄴㅀㄶㅁ넣렇"),
              ])

           */
      ],
    );


  }

  //서버에서 데이터 가져온다.
  void getItemInfosFromSvr() async{
    cardItemList.clear();
    List<CardItemModel> items = await NetworkManager.getInstance.getItems(0,100);
    print(items);

    setState(() {
      cardItemList = items;
    });
  }

  void reqInsertDiaryToSvr() async{
    CardItemModel item = CardItemModel(
      contents: _contentTextEditingController.text,
      createdBy: _authorTextEditingController.text
    );
    bool result = await NetworkManager.getInstance.insertItem(item);
    //등록 성공하면 아이템을 다시 불러온다.
    if(result){
      getItemInfosFromSvr();
      _contentTextEditingController.text = "";
      _authorTextEditingController.text = "";
    }else{

    }
  }

}