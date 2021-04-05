import 'dart:math';

import 'package:flutter/material.dart';
import 'constants.dart';

// return GestureDetector inside container
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.childCard,this.onpress});
  final Color colour;
  final Widget childCard;
  final Function onpress ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}



// return GestureDetector inside container box pink
class BottomButton extends StatelessWidget {

  BottomButton({ this.onTap, this.title});

  final Function onTap;
  final String  title;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(title,style: kCalcStyle,)),
        color: kColorPink,
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 7.0),
      ),
    );
  }
}




// make Floating Action Button for me
class RoundIconButton extends StatelessWidget {

  RoundIconButton({ this.icon ,this.onPress });
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon) ,
      onPressed: onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0
      ),
      fillColor: Color(0xff4c4f5e),
      shape: CircleBorder(),


    );
  }
}



class CalculatorBrain{

  CalculatorBrain(this.height, this.weight);

  final int height ;
  final int weight ;
  double _bmi ;

  String calculateBMI (){
    _bmi = weight /pow((height/100), 2);
    return _bmi.toStringAsFixed(1) ;
  }

  String getResult(){
    if(_bmi>= 25 ){
      return 'Overweight';
    }else if(_bmi >18){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>= 25 ){
      return 'You have a higher than normal body weight. Try to exercise more. :D';
    }else if(_bmi >18){
      return 'You have a normal body weight. Good Job! .';
    }else {
      return 'You have a lower than normal body weight. Yow can eat a bit more.';
    }
  }





}







