import 'package:currency_converter/curr.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class CurrModel extends ChangeNotifier {
  List<Curr> currList = List();
  List<String> cName, cPrice;

  fetchItem(String from, String to, String quantity) async {
    String apiurl = 'https://api.exchangeratesapi.io/latest?base=$from';
    http.Response response = await http.get(apiurl);
    var data = json.decode(response.body);
    Map<String, dynamic> curr = data["rates"];
    curr.forEach((key, value) {
      if (to == key.toString() &&
          !currList.contains(Curr(key, from.toString(), value, quantity))) {
        currList.add(Curr(key, from.toString(), value, quantity));
      }
    });
    notifyListeners();
  }

  clearItem() {
    currList = [];
  }
}
