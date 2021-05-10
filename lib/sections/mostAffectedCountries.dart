import 'package:flutter/material.dart';

class MostAffectedCountries extends StatelessWidget {

  final List countriesData ;

  const MostAffectedCountries({Key key, this.countriesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true ,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10,),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    child: Image.network(countriesData[index]['countryInfo']['flag'],
                    height: 30,
                    width: 30 ),
                  ),
                  Text(countriesData[index]['country']),
                  Text(' '),
                  Text(countriesData[index]['deaths'].toString()),
                ],
              ),
            ),
          );
        },
        itemCount: 5,
      ),
      
    );
  }
}