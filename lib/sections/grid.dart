import 'package:flutter/material.dart';


class Grid extends StatelessWidget {
  final Map worldData;

  const Grid({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2,crossAxisCount:2),
          children:[
            StatusPanel(
              title:'CONFIRMED',
              panelColor: Colors.red[100],
              textColor:Colors.red,
              count: worldData['cases'].toString(),
            ),
            StatusPanel(
               title:'ACTIVE',
              panelColor: Colors.blue[100],
              textColor:Colors.blue,
             count: worldData['active'].toString(),
            ),
            StatusPanel(
               title:'RECOVERED',
              panelColor: Colors.green[100],
              textColor:Colors.green,
              count: worldData['recovered'].toString(),
            ),
            StatusPanel(
               title:'DEATHS',
              panelColor: Colors.grey[400],
              textColor:Colors.black,
             count: worldData['deaths'].toString()
             
             ,
            ),
          ]

      ),
    );
  }
}


class StatusPanel extends StatelessWidget {


  final Color panelColor ; 
  final Color textColor;
  final String title ;
  final String count ;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key); 
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width ;

    return Container(
      margin: EdgeInsets.all(5),
      height:80,
      width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ,
          style:TextStyle(fontWeight:FontWeight.bold,fontSize: 16,color: textColor),
          ),
          Text(count,
          style:TextStyle(fontWeight:FontWeight.bold,fontSize: 14,color: textColor),
          ),
          
        ],
      ),
    );
  }
}