import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/main.dart';
import 'package:yasam_beklentisi/resultPage.dart';
import 'package:yasam_beklentisi/userData.dart';
import './IconGender.dart';
import './ContainerProperty.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './constants.dart';
import './resultPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String seciliGender = ' ';
  double smokedCigarette = 0;
  double exercize = 0;
  double height = 170;
  double weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,

          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('HEIGHT'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('WEIGHT'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        'how many times a week do you exercise',
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        exercize.round().toString(),
                        textAlign: TextAlign.center,
                        style: numbersStyle,
                      ),
                    ),
                    Slider(
                        min: 0,
                        max: 7,
                        value: exercize,
                        onChanged: (double newValue) {
                          setState(() {
                            exercize = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'how many cigarettes you smoke per day',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(smokedCigarette.round().toString(),
                        style: numbersStyle),
                    Slider(
                        min: 0,
                        max: 30,
                        value: smokedCigarette,
                        onChanged: (double newValue) {
                          setState(() {
                            smokedCigarette = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                        onPress: () {
                          setState(() {
                            seciliGender = 'FEMALE';
                          });
                        },
                        colorr: seciliGender == 'FEMALE'
                            ? Colors.pinkAccent
                            : Colors.white60,
                        child: ColumnWidget(
                          icon: FontAwesomeIcons.venus,
                          gender: 'FEMALE',
                        )),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliGender = 'MALE';
                        });
                      },
                      colorr: seciliGender == 'MALE'
                          ? Colors.lightBlueAccent
                          : Colors.white60,
                      child: ColumnWidget(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              buttonColor: Colors.white60,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.white60),
                  //color:Colors.white60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(UserData(
                                smokedCigarette: smokedCigarette,
                                weight: weight,
                                height: height,
                                seciliGender: seciliGender,
                                exercize: exercize))));
                  },
                  child: Text(
                    'CalCulate',
                    style: textStyle,
                  )),
            )
          ],
        ));
  }

  Row buildRowOutlineButton(
    String text,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 400.0,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            )),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              //'$height.round()',
              text == 'HEIGHT'
                  ? height.round().toString()
                  : weight.round().toString(),
              textAlign: TextAlign.center,
              style: numbersStyle,
            )),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: SizedBox(
                width: 68,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      text == 'HEIGHT' ? height++ : weight++;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonTheme(
              child: SizedBox(
                width: 68,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      text == 'HEIGHT' ? height-- : weight--;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 14,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
