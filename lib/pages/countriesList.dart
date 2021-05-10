import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19/pages/Search.dart';
class countriesList extends StatefulWidget {
  @override
  _countriesListState createState() => _countriesListState();
}

class _countriesListState extends State<countriesList> {
  List countriesData;
  var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries");

  fetchCountiresData() async {
    http.Response response = await http.get(url);
    //print(response.body);
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountiresData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon:Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: Search(countriesData));
          },)
        ],
        title: Text('Countries List'),
      ),
      body: countriesData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 130,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 10,
                        offset: Offset(0, 8)),
                  ]),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(countriesData[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Image.network(
                              countriesData[index]['countryInfo']['flag'],
                              height: 100,
                              width: 70,
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container(
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('CONFIRMED ' +  countriesData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                            Text('ACTIVE ' +  countriesData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
                            Text('DEATHS ' +  countriesData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                            Text('RECOVERED ' +  countriesData[index]['todayRecovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green)),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              },
              itemCount: countriesData == null ? 0 : countriesData.length,
            ),
    );
  }
}
