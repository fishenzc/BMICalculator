import 'package:bmi/widgets/left_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import '../constant/app_constants.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_final_fields
  TextEditingController _heightController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )),
                ),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              _bmiResult = _w / (_h * _h);

              setState(() {
                if (_bmiResult > 25) {
                _textResult = 'You are Over Weight';
              } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                _textResult = 'You are Normal Weight';
              } else {
                _textResult = 'You are Under Weight';
              }      
              });    
            },
            
            child: Container(
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
          ),

          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor),
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 29.0),
          // ignore: prefer_const_constructors
          RightBar(barWidth: 40.0),
          // ignore: prefer_const_constructors
          SizedBox(height: 20.0),
          // ignore: prefer_const_constructors
          RightBar(barWidth: 70.0),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          // ignore: prefer_const_constructors
          RightBar(barWidth: 40),
          // ignore: prefer_const_constructors
          SizedBox(height: 20.0),
          // ignore: prefer_const_constructors
          LeftBar(barWidth: 50.0),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
          ),
          // ignore: prefer_const_constructors
          LeftBar(barWidth: 50),
        ],
      )),
    );
  }
}
