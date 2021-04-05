import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveColorDark;
  Color femaleCardColor = kInactiveColorDark;
  Gender genderSelected;
  int height =180 ;
  int weight= 60 ;
  int age =18 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        genderSelected = Gender.Male;
                      });
                    },
                    colour: genderSelected == Gender.Male
                        ? kActiveColorDark
                        : kInactiveColorDark,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                onpress: (){
                setState(() {
                genderSelected=Gender.Female ;
                });
                },
                        colour: genderSelected == Gender.Female
                            ? kActiveColorDark
                            : kInactiveColorDark,
                        childCard: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        )),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kInactiveColorDark,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',style: kLabelStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(height.toString(),style:kLabelBigStyle,),
                    Text('cm',style: kLabelStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8d8e98),
                    thumbColor: kColorPink ,
                    overlayColor: Color(0x29eb1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 280.0,
                    activeColor: kColorPink,
                    inactiveColor: Color(0xff8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kInactiveColorDark,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style:kLabelStyle,),
                      Text(weight.toString(),style: kLabelBigStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         RoundIconButton(icon: FontAwesomeIcons.minus,
                         onPress: (){
                           setState(() {
                             weight --;
                           });
                         },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPress: (){
                           setState(() {
                             weight++;
                           });
                          },),
                        ],
                      ),
                    ],
                  ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kInactiveColorDark,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kLabelStyle,),
                      Text(age.toString(),style: kLabelBigStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              age --;
                            });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                age ++;
                              });
                            },),
                        ],
                      ),
                    ],
                  ),),
                ),
              ],
            ),
          ),
          BottomButton(title:'CALCULATE' ,
            onTap:  (){
            CalculatorBrain calc=CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              bmiResult:calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),)));
            },),

        ],
      ),
    );
  }
}




