import 'package:http/http.dart' as http;
import 'package:web_app/DEFINES.dart';
import 'package:web_app/Models/CardItemModel.dart';
import 'dart:convert';

class NetworkManager {

  NetworkManager._privateConstructor();
  static final NetworkManager _instance = NetworkManager._privateConstructor();
  static NetworkManager get getInstance => _instance;

  Future<List<CardItemModel>> getItems(int startIdx, int reqCnt) async{

    List<CardItemModel> resultItems = List<CardItemModel>();
    String reqUrl = REST.BASE_URL+REST.READ+"?startIdx=$startIdx&reqCnt=$reqCnt";
    var response = await http.get(reqUrl);

    var resListData = json.decode(response.body)["data"] as List;
    resListData.forEach((element) {
      CardItemModel item = CardItemModel(createdBy: element[1], contents: element[3],createdAt: "11");
      resultItems.add(item);
    });

    return resultItems;

  }

  Future<bool> insertItem(CardItemModel item) async{
    String reqUrl = REST.BASE_URL+REST.CREATE+"?createdBy=${item.createdBy}&contents=${item.contents}";

    print("reqURL : $reqUrl");


    var response = await http.get(reqUrl);
    var resListData = json.decode(response.body);

    if(resListData["resultCode"] == 200){
      print("등록 성공!");
      return true;
    }else{
      return false;
    }

  }

}