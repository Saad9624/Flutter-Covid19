import 'package:covid19/dataSource.dart';
import 'package:flutter/material.dart';

class FAQS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :Text('FAQs')),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index){
        return ExpansionTile(
          title:Text(DataSource.questionAnswers[index]['question'],
          style: TextStyle(fontWeight: FontWeight.bold),),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text(DataSource.questionAnswers[index]['answer']),
            )
          ],
        );
        
      }),
      
    );
  }
}