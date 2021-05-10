import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List countriesData ;

  Search(this.countriesData);


 
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(icon:Icon(Icons.clear),onPressed:(){
          query='';
        })
      ];
    }
  
    @override 
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back_rounded),onPressed: (){
        Navigator.pop(context);
      },);
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      final suggestionList = query.isEmpty ? countriesData : 
      countriesData.where((element) =>
      element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
        return Container (
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
                            Text(suggestionList[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Image.network(
                              suggestionList[index]['countryInfo']['flag'],
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
                            Text('CONFIRMED ' +  suggestionList[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                            Text('ACTIVE ' +  suggestionList[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
                            Text('DEATHS ' +  suggestionList[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                            Text('RECOVERED ' +  suggestionList[index]['todayRecovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.green)),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
      });
  }

}