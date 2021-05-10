import 'dart:convert';

import 'package:covid19/dataSource.dart';
import 'package:covid19/pages/countriesList.dart';
import 'package:covid19/sections/grid.dart';
import 'package:covid19/sections/infoSection.dart';
import 'package:covid19/sections/mostAffectedCountries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  List countriesData;
  var url = Uri.parse("https://corona.lmao.ninja/v3/covid-19/all");
  var countriesUrl =
      Uri.parse("https://corona.lmao.ninja/v3/covid-19/countries");

  fetchWorldWideDaata() async {
    http.Response response = await http.get(url);
    //print(response.body);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchCountriesData() async {
    http.Response response = await http.get(countriesUrl);
    // print(response.body);
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideDaata();
    fetchCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COVID-19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WorldWide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => countriesList()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : Grid(
                    worldData: worldData,
                  ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            countriesData == null
                ? CircularProgressIndicator()
                : MostAffectedCountries(countriesData: countriesData),
            InfoSection(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
