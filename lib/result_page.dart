import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';


class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult,this.resultText,this.interpretation});

final String bmiResult;
final String resultText ;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('YOUR RESULT',style: kYourRes,),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
                colour: kInactiveColorDark ,
              childCard: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText.toUpperCase(),style: kResStyle,),
                  Text(bmiResult,style: kBMItexy,),
                  Text(interpretation,
                    textAlign: TextAlign.center,style: kNormalStyle,),
                ],

              ),

            ),
          ),
          BottomButton(title: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),

        ],
      )
    );
  }
}
