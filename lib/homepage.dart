import 'package:currency_converter/calculation.dart';
import 'package:currency_converter/currmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    void _showSettingsPanel() {
      showModalBottomSheet(
          backgroundColor: Colors.lightGreen[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Calculation(),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text("Currency Converter"),
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.settings,
            ),
            label: Text(
              "Clear",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                Provider.of<CurrModel>(context, listen: false).clearItem();
              });
            },
          )
        ],
      ),
      body: Consumer<CurrModel>(
        builder: (context, cmod, child) {
          return Center(
            child: ListView.builder(
              itemCount: cmod.currList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(cmod.currList[index].toString()),
                    onDismissed: (direction) {
                      setState(() {
                        cmod.currList.removeAt(index);
                      });

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Item Removed")));
                    },
                    background: Container(color: Colors.red),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        ListTile(
                            title: Text(cmod.currList[index].name.toString()),
                            subtitle: Text(
                                '${cmod.currList[index].name2.toString()} to ${cmod.currList[index].name.toString()}\nquantity = ${cmod.currList[index].quantity.toString()}'),
                            trailing: Text(
                              (cmod.currList[index].price *
                                      double.parse(
                                          '${cmod.currList[index].quantity}'))
                                  .toString(),
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        onPressed: () => _showSettingsPanel(),
      ),
    );
  }
}
