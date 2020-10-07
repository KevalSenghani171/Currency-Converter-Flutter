import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currmodel.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  List<String> currencyName = [
    'CAD',
    'HKD',
    'ISK',
    'PHP',
    'DKK',
    'HUF',
    'CZK',
    'GBP',
    'RON',
    'SEK',
    'IDR',
    'INR',
    'BRL',
    'RUB',
    'HRK',
    'JPY',
    'THB',
    'CHF',
    'EUR',
    'MYR',
    'BGN',
    'TRY',
    'CNY',
    'NOK',
    'NZD',
    'ZAR',
    'USD',
    'MXN',
    'SGD',
    'AUD',
    'ILS',
    'KRW',
    'PLN',
  ];
  String from, to, quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    dropdownColor: Colors.amber[300],
                    hint: Text(from == null ? 'FROM' : from),
                    value: from,
                    items: currencyName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        from = value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    dropdownColor: Colors.amber[300],
                    hint: Text(to == null ? 'TO' : to),
                    value: to,
                    items: currencyName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        to = value;
                      });
                    },
                  ),
                ],
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Quantity',
                    labelStyle: TextStyle(color: Colors.black)),
                onChanged: (val) => setState(() => quantity = val),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                onPressed: () {
                  Provider.of<CurrModel>(context, listen: false).fetchItem(
                      from.toString(), to.toString(), quantity.toString());

                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
