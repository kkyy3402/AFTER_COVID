import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/Models/CardItemModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<CardItemModel> cardItemList = <CardItemModel>[];

  @override
  void initState() {
    super.initState();

    //테스트용 데이터를 만든다.
    makeDefaultItemList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [

              getTopView(),
              getBottomView()



            ],
          )
      ),
    );
  }

  Widget getTopView() {
    return Stack(
      children: [

        Image.asset(
          "assets/imgs/top_bg.png",
          fit: BoxFit.fill,
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
                              text: '코로나',
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
                          placeholder: "하고싶은 일을 적어주세요",
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
                            placeholder: "이름을 적어주세요",
                            style: TextStyle(

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
                        print("버튼 눌렸습니다!");
                      },
                      color: Colors.black,
                      child: Text(
                        "소원빌기",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
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
                        color: Colors.white
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
      width: double.infinity,
      height: 500,
      child: Column(
        children: [

          RichText(
            //maxLines: 1,
            softWrap: false,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'nn개',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '의 소망이 모여',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20)),
              ],
            ),
          ),

          Text(
            "애프터 코로나를 기원합니다.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          getBottomCardView()

        ],
      ),
    );
  }

  //하단의 그리드 뷰를 불러오는
  getBottomCardView() {
    return Container(
      padding: EdgeInsets.all(16),
      width: 200,
      height: 200,
      child: Column(
        children: [

          Expanded(
            child: Column(
              children: [

                Text("코로나 이후",
                  textAlign: TextAlign.left),
                Text("어쩌구를"),
                Text("하고싶어요")

              ],
            ),
          ),

          Divider(),

          Container(
            width: double.infinity,
            child: Text(
                "by " + cardItemList[0].createdBy,
              textAlign: TextAlign.left,
              style: TextStyle(

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
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  void makeDefaultItemList() {
    for (int i = 0 ; i < 100 ; i++) {
      cardItemList.add(CardItemModel(content: "내용${i}", createdBy: "글쓴이${i}",createdAt: "${i}"));
    }

  }
}

