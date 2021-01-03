import 'package:flutter/cupertino.dart';

class REST{
  static String BASE_URL = "http://kkyy3402.iptime.org:21000/rest/";
  static String CREATE = "insertDiary";
  static String READ = "getDiaryList";
  static String GET_CNT = "getTotalDiaryCount";
}

class USER_AGENT_TYPE{
  static String APPLE = "apple";
  static String ANDROID = "android";
  static String DESKTOP = "desktop";
}

class ITEM_COLOR_PALETTE{
  static List<List<Color>> colorList = [[Color.fromARGB(255, 186, 179, 241), Color.fromARGB(255, 249, 148, 125)],
    [Color.fromARGB(255, 251, 218, 97), Color.fromARGB(255, 255, 90, 205)],
    [Color.fromARGB(255, 250, 139, 255), Color.fromARGB(255, 43, 210, 255)],
    [Color.fromARGB(255, 109, 168, 255), Color.fromARGB(255, 106, 234, 255)]
  ];
}