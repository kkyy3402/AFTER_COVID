import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:web_app/Managers/NetworkManager.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'package:web_app/Util/AnimatedFlipCounter.dart';
import 'package:web_app/Util/CustomDialogBox.dart';
import 'package:web_app/Util/Util.dart';
import 'package:web_app/Widgets/CardView.dart';
import 'package:web_app/Widgets/ShowContentsPopup.dart';

import '../DEFINES.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<CardItemModel> _cardItemList = <CardItemModel>[];

  //글자수 제한
  int _maxContentLength = 140; // 내용 글자수 제한
  int _maxAuthorLength = 14; // 글쓴이 글자수 제한

  int _currentContentTextLength = 0; //현재 입력된 내용 글자 갯수
  int _currentAuthorTextLength = 0; //현재 입력된 글쓴이 글자 갯수
  int _totalItemCntInSvr = 0; //서버에 있는 전체 아이템 갯수

  final ScrollController _scrollController = ScrollController();
  final ScrollController _contentScrollController = ScrollController();

  TextEditingController _contentTextEditingController;
  TextEditingController _authorTextEditingController;

  double _prevPosition = 0.0;

  bool _screenOnTop = true; // 화면이 가장 위에 있는지 여부

  @override
  void initState() {

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();

    initTextFieldControllers();
    getItemInfosFromSvr();
    initScrollListener();
    getTotalItemCnt();

  }

  @override
  void dispose() {
    _contentTextEditingController.dispose();
    _authorTextEditingController.dispose();
    _contentScrollController.dispose();
    //_contentUpdateCounter.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        opacity: _screenOnTop ? 0.0 : 1.0,
        duration: Duration(milliseconds: 300),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(196, 34, 34, 34),
          shape: RoundedRectangleBorder(),
          child: Icon(
            Icons.arrow_upward_rounded,
            color: Colors.white,
          ),
          onPressed: (){
            _scrollController.animateTo(0.0, duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
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
          height: 400,
          width: double.infinity,
          /*
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]),
          ),
           */
          child: Image.asset(
            "assets/imgs/sky.png",
            fit: BoxFit.fill,
          ),
        ),

        Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 400,
            child: Stack(
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        "assets/imgs/moon.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    RichText(
                      //maxLines: 1,
                      softWrap: false,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '코로나',
                              style: GoogleFonts.nanumMyeongjo(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )),
                          TextSpan(
                              text: '가 끝나면 나는',
                              style: GoogleFonts.nanumMyeongjo(
                                  fontSize: 24,
                                  color: Colors.white
                              )
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    Container(
                        width: 300,
                        height: 70,
                        child: TextField(
                          controller: _contentTextEditingController,
                          maxLength: _maxContentLength,
                          maxLines: 1,
                          decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              //labelText: '하고싶은 일을 적어주세요',
                              hintText: '하고싶은 일을 적어주세요',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 198, 198, 198)
                              ),
                              contentPadding: EdgeInsets.only(left: 18,top: 12,bottom: 12,right: 12)
                          ),

                          style:  GoogleFonts.nanumMyeongjo(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),

                          /*
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "NanumMyeongjo",
                              fontWeight: FontWeight.bold
                          ),*/

                        )

                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(width: 15),

                        Container(
                          width: 180,
                          child: TextField(
                            maxLength: _maxAuthorLength,
                            controller: _authorTextEditingController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(
                                  width: 0,
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

                        SizedBox(width: 15),

                      ],
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    RaisedButton(
                      onPressed: (){
                        //reqInsertDiaryToSvr();

                        if(checkTextFieldEmpty()){
                          showItemRegisterDialog();
                        }


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
                    )

                  ],
                ),

              ],
            )
        ),


        Container(
          color: Colors.transparent,
          height: 36,
          child: Row(
            children: [

              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "BILLI",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SpaceMono",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "After Covid-19",
                    style: TextStyle(
                        color: Colors.white
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


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              AnimatedFlipCounter(
                duration: Duration(milliseconds: 1000),
                value: _totalItemCntInSvr, /* pass in a number like 2014 */
                color: Colors.black,
                size: 24,
              )

              ,Text(
                  "개의 소망이 모여",
                  style:
                  GoogleFonts.nanumMyeongjo(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )
              ),
            ],
          ),



          SizedBox(height: 8),

          Text(
              "애프터 코로나를 기원합니다.",
              style: GoogleFonts.nanumMyeongjo(
                fontSize: 24,
              )
          ),

          SizedBox(
            height: 32,
          ),

          getMessageCards()

        ],
      ),
    );
  }



  void makeDefaultItemList() {
    for (int i = 0 ; i < 3 ; i++) {
      _cardItemList.add(CardItemModel(contents: "내용${i}", createdBy: "글쓴이${i}",createdAt: "${i}"));
    }

  }

  getFooter() {
    return Container(
      decoration: BoxDecoration(

      ),

      alignment: Alignment.center,
      height: 60,
      child: Text(
        "Copyright 2021. Team BILLI All right reserved",
      ),
    );
  }

  String getUserAgent(){
    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if( userAgent.contains("iphone"))  return USER_AGENT_TYPE.APPLE;
    if( userAgent.contains("android"))  return USER_AGENT_TYPE.ANDROID;

    // tablet
    if( userAgent.contains("ipad")) return USER_AGENT_TYPE.ANDROID;
    if( html.window.navigator.platform.toLowerCase().contains("macintel") && html.window.navigator.maxTouchPoints > 0 ) return USER_AGENT_TYPE.ANDROID;

    return USER_AGENT_TYPE.DESKTOP;
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

    //User-Agent에 따라, 화면에 표출되는 Column 카운트를 변경시킨다.
    if(getUserAgent() == USER_AGENT_TYPE.ANDROID || getUserAgent() == USER_AGENT_TYPE.APPLE){
      columnCnt = 1;
    }

    int rowCnt = (_cardItemList.length / columnCnt).toInt() ;
    print("rowCnt : $rowCnt");

    return Container(
        alignment: Alignment.center,
        height: rowCnt.toDouble() * 260,
        width: 240 * columnCnt.toDouble() ,
        child: getBottomCardRows(rowCnt, columnCnt)
    );

    /*
    return Column(
      children: [
        for (int columnIdx = 0 ; columnIdx < _cardItemList.length / columnCnt ; columnIdx++)
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int rowCnt = 0 ; rowCnt < columnCnt ; rowCnt++)
                  _cardItemList.length > columnIdx * columnCnt + rowCnt?
                  InkWell(
                    onTap: (){
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return ShowItemPopup(item:_cardItemList[columnIdx * columnCnt + rowCnt]);
                          }
                      );
                    },
                    child: getBottomCardView(
                        "${_cardItemList[columnIdx * columnCnt + rowCnt].createdBy}",
                        "${_cardItemList[columnIdx * columnCnt + rowCnt].contents}"),
                  ) : Container()

              ]),
      ],
    );*/


  }

  void getTotalItemCnt() async{
    int totalItemCnt = await NetworkManager.getInstance.getTotalItemCnt();
    setState(() {
      _totalItemCntInSvr = totalItemCnt;
    });


  }

  //서버에서 데이터 가져온다.
  void getItemInfosFromSvr() async{
    //cardItemList.clear();
    List<CardItemModel> items = await NetworkManager.getInstance.getItems(_cardItemList.length,50);



    var adItem = CardItemModel(
        contents: "22222",
        createdBy: "아재",
        backgroundIdx: 0,
        createdAt: "",
        isAd: true
    );

    var rng = new Random();
    int offsetIdx = 0;
    for (var idx = 0 ; idx < items.length ; idx++ ){
      int randomInt = rng.nextInt(10) + 7;

      if(randomInt + offsetIdx < items.length){
        items.insert(randomInt + offsetIdx, adItem);
        offsetIdx += randomInt;
      }

    }

    items.forEach((element) {
      _cardItemList.add(element);
    });

    setState(() {

    });
  }

  void reqInsertDiaryToSvr(CardItemModel item) async{

    //print("item email : ${item.email}");
    //print("item backgroundIdx : ${item.backgroundIdx}");
    //print("item backgroundIdx : ${item.backgroundIdx}");

    setState(() {
      //첫번째 항목에 바로 추가한다.
      _cardItemList.insert(0, item);
      _totalItemCntInSvr += 1;
    });

    showToast("소원이 등록되었습니다!");

    bool result = await NetworkManager.getInstance.insertItem(item);

    //등록 성공하면 아이템을 다시 불러온다.
    if(result){
      //getItemInfosFromSvr();
      _contentTextEditingController.text = "";
      _authorTextEditingController.text = "";
    }else{

    }
  }

  void initScrollListener() {



    _contentScrollController.addListener(() {
      //print(_contentScrollController.offset);

      _prevPosition = _contentScrollController.offset;
      //print("_prevPosition : ${_prevPosition}");
      //print("position m: ${_contentScrollController}");

      if(_contentScrollController.offset == 0) {
        if(Platform.isIOS || Platform.isAndroid){
          showToast("스크롤이 올라갑니다 :)");
          _scrollController.animateTo(0.0, duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
        }
      }

      if(_contentScrollController.offset == _contentScrollController.position.maxScrollExtent){
        if(Platform.isIOS || Platform.isAndroid) {
          showToast("스크롤이 내려갑니다 :)");
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 1000),
              curve: Curves.linearToEaseOut);
        }
      }

    });

    _scrollController.addListener(() {
      if(_scrollController.offset < 100){
        setState(() {
          _screenOnTop = true;
        });
      }else{
        setState(() {
          _screenOnTop = false;
        });
      }

      //print("_scrollController : ${_scrollController.offset}");

      if(_scrollController.position.maxScrollExtent == _scrollController.offset){
        checkAdditionalItemCnt();
      }
    });
  }

  void initTextFieldControllers() {


    _contentTextEditingController = TextEditingController();
    _contentTextEditingController.addListener(() {
      setState(() {
        _currentContentTextLength = _contentTextEditingController.text.length;
      });

    });
    _authorTextEditingController = TextEditingController();
    _authorTextEditingController.addListener(() {
      setState(() {
        _currentAuthorTextLength = _authorTextEditingController.text.length;
      });

    });
  }

  void checkAdditionalItemCnt() async {
    int totalItemCnt = await NetworkManager.getInstance.getTotalItemCnt();
    if(_cardItemList.length < totalItemCnt){
      //print("cardItemList.length : ${_cardItemList.length}, totalItemCnt : ${totalItemCnt}");
      //print("서버에 더 받을 아이템이 있습니다.");
      getItemInfosFromSvr();
    }else{
      //print("서버에 더 받을 아이템이 없습니다.");
    }

  }

  void showItemRegisterDialog() {

    if(!checkTextFieldEmpty()){
      return;
    }

    CardItemModel item = CardItemModel(
        contents: _contentTextEditingController.text,
        createdBy: _authorTextEditingController.text,
        backgroundIdx: 0
    );

    showDialog(context: context,
        builder: (BuildContext context){
          return ItemRegisterDialogBox(
              item: item
          );
        }
    ).then((colorIdx) => {

      if(colorIdx != null){
        //print("ㅎㅎㅎ11"),
        if(colorIdx != -1){
          //print("ㅎㅎㅎ"),

          //
          //reqInsertDiaryToSvr(colorIdx)

          showDialog(
              context: context,
              builder: (BuildContext context){
                return EmailRegisterPopup(
                    item
                );
              }
          ).then((item) {
            if(item != null){
              //print("item : ${item}");
              reqInsertDiaryToSvr(item);
            }
          })

          /*
           showDialog(context: context,
        builder: (BuildContext context){
          return ItemRegisterDialogBox(
              item: item
          );
        }
    ).then((colorIdx) => {

      if(colorIdx != null){
        print("ㅎㅎㅎ11"),
        if(colorIdx != -1){
          print("ㅎㅎㅎ"),

          //
          //reqInsertDiaryToSvr(colorIdx)
        }else{
          print("취소")
        }
      }else{
        print("22222"),
      }


    }
           */


        }else{
          //print("취소")
        }
      }else{
        //print("22222"),
      }


    });

  }

  bool checkTextFieldEmpty(){
    if(_contentTextEditingController.text.length == 0){
      showToast("내용을 입력해주세요");
      return false;
    }

    if(_authorTextEditingController.text.length == 0){
      showToast("이름을 입력해주세요");
      return false;
    }

    return true;

  }

  Widget getBottomCardRows(int rowCnt, int columnCnt) {

    return Column(
      children: [

        for(int rowIdx = 0 ; rowIdx < rowCnt ; rowIdx++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int columnIdx = 0 ; columnIdx < columnCnt ; columnIdx++)
                _cardItemList.length != 0 ? getImagedCardViewForMainScreen(_cardItemList[columnIdx + rowIdx * columnCnt], context, columnIdx + rowIdx * columnCnt) : Container()
            ],
          )
      ],
    );

    /*
    return Column(
        children : List.generate(_cardItemList.length,(index){
          return Row(
            children: [
              getImagedCardViewForMainScreen(_cardItemList[index], context),
              getImagedCardViewForMainScreen(_cardItemList[index], context),
              getImagedCardViewForMainScreen(_cardItemList[index], context),
              getImagedCardViewForMainScreen(_cardItemList[index], context)
            ],
          );
        })
    );*/



  }

}