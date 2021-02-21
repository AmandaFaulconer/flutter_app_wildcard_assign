
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage(),
    routes: <String, WidgetBuilder>{
      "/HomePage": (BuildContext)=> HomePage(),
      "/TextPage": (BuildContext)=> TextPage(),
      "/TiltPage": (BuildContext)=> TiltPage(),
      "/QuizPage": (BuildContext)=> QuizPage(),
    },
  ));
}
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//HomePage----------------------------------------------------------------------
class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{

  int selectedradio;
  @override
  void initState(){
    super.initState();
    selectedradio = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedradio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("Home",
              style: TextStyle(
                fontSize: 35.0,
              ),)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
                children: <Widget>[
                  //-----------------------------------------------------

                  Text("What would you like to do?", style: TextStyle(
                    fontSize: 24.0,),),

                  new Padding(padding: EdgeInsets.all(8.0)),

                  new Divider(
                    color: Colors.cyan,
                    height: 10.0,
                    thickness: 3.0,
                    indent: 35.0,
                    endIndent: 35.0,
                  ),

                  new Padding(padding: EdgeInsets.all(8.0)),

                  Text("Do some light reading", style: TextStyle(
                        fontSize: 20.0,
                  ),),
                  Radio(value: 1,
                        groupValue: selectedradio,
                        activeColor: Colors.cyanAccent,
                        onChanged: (val){
                          Navigator.of(context).pushNamed("/TextPage");
                          print("Radio $val");
                          setSelectedRadio(val);},),
                  new Padding(padding: EdgeInsets.all(8.0)),

                  //-----------------------------------------------------

                  Text("Move Mario", style: TextStyle(
                    fontSize: 20.0,),),

                  Radio(value: 2,
                        groupValue: selectedradio,
                        activeColor: Color(0xffFE0002),
                        onChanged: (val){
                          Navigator.of(context).pushNamed("/TiltPage");
                          print("Radio $val");
                          setSelectedRadio(val);},),

                  new Padding(padding: EdgeInsets.all(8.0)),

                  //-----------------------------------------------------


                  Text("Take a quiz", style: TextStyle(
                    fontSize: 20.0,),),
                  Radio(
                    value: 3,
                    groupValue: selectedradio,
                    activeColor: Colors.red,
                    onChanged: (val){
                      Navigator.of(context).pushNamed("/QuizPage");
                      print("Radio $val");
                      setSelectedRadio(val);},),

                  new Padding(padding: EdgeInsets.all(8.0)),


                ]
            ),
          )
      ),
    );
  }
}


//txt page------------------------------------------------------------------
class TextPage extends StatefulWidget{
  _TextPage createState() => _TextPage();
}

class _TextPage extends State<TextPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("Lets Read!",
              style: TextStyle(
                fontSize: 35.0,
              ),)),
      ),
      body: Center(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: [
              Text("The Snow Queen \nby Hans Christian Andersen",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 26.0,
                  fontWeight: FontWeight.bold,
              ),),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Divider(
                color: Colors.cyan,
                height: 10.0,
                thickness: 3.0,
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              FutureBuilder(
                  future:   DefaultAssetBundle.of(context).loadString(
                      "assets/loremipsum.txt"),

                  builder: (context, snapshot) {
                    return Text(snapshot.data ?? '', softWrap: true,
                      style: TextStyle(
                      fontSize: 18.0
                    ),);
                  }
              ),

              new Padding(padding: EdgeInsets.all(8.0)),
            ],
          ),
        ),
      ),
    );
  }
}


//slider page---------------------------------------------------------------
class TiltPage extends StatefulWidget{
  _TiltPage createState() => _TiltPage();
}

class _TiltPage extends State<TiltPage> {

  double value1 = 0;
  double _currentSliderValue1 = 0;

  myslider3(){
    return Slider(
      activeColor: Color(0xff0001FC),
      inactiveColor: Color(0xffFE0002),
      max: 360,
      min: 0,
      value: _currentSliderValue1,
      onChanged: (double newvalue){
        setState(() {
          value1 = newvalue.roundToDouble();
          _currentSliderValue1 = newvalue.roundToDouble();
          myRotate();
        });
      },
    );
  }

  myRotate(){
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(angle: value1 * (pi/180),

        child: Image.asset(
          "images/mario.png",
          height: 300,
          width: 300,),
      ),
    );
  }

  //------------------------------------------------------------
  double value2 = 0;
  double _currentSliderValue2 = 0;

  myslider2(){
    return Slider(
      activeColor: Color(0xff0001FC),
      inactiveColor: Color(0xffFE0002),
      max: 50,
      min: 0,
      value: _currentSliderValue2,
      onChanged: (double newvalue){
        setState(() {
          value2 = newvalue.roundToDouble();
          _currentSliderValue2 = newvalue.roundToDouble();
          myMove();
        });
      },
    );
  }

  myMove(){
    return Container(
        padding: EdgeInsets.only(top: 65.0),
        child: Transform.translate(
          offset: Offset(_currentSliderValue2, 0.0),
          child: Image.asset(
            "images/mario.png",
            height: 300,
            width: 300,
          ),
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("Drag the Slider",
              style: TextStyle(
                fontSize: 35.0,
              ),)),
      ),
      body: Center(
        child: Center(
          child: ListView(
            children: [
              new Padding(padding: EdgeInsets.all(15.0)),

              //-------------------------------------------------------

              Text("Make Mario Spin",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                fontWeight: FontWeight.bold),),
              new Padding(padding: EdgeInsets.all(15.0)),
              myslider3(),
              new Padding(padding: EdgeInsets.all(15.0)),
              myRotate(),

              //---------------------------------------------------------
              new Padding(padding: EdgeInsets.only(top: 50.0)),

              Text("Make Mario Move",
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),),
              new Padding(padding: EdgeInsets.all(15.0)),
              myslider2(),
              myMove(),
              new Padding(padding: EdgeInsets.only(bottom: 30.0)),
            ],
          ),
        ),
      ),
    );
  }
}




//quiz page-----------------------------------------------------------------
class QuizPage extends StatefulWidget{
  _QuizPage createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {

  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
        case 1:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
      }
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 1:
          Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
          break;
        case 2:
          Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          correctScore++;
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              backgroundColor: Colors.cyan,
              centerTitle: true,
              title: Text("Take a Quiz!",
                style: TextStyle(
                  fontSize: 35.0,
                ),)),
        ),
        body: new Container(
            padding: EdgeInsets.all(10.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'A Quiz for the Seasons!',
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0),),
                  new Divider(height: 8.0,
                    thickness: 3.0, color:
                    Colors.pink,
                    indent: 30.0,
                    endIndent: 30.0,),


//Question 1-------------------------------------------------------------------
                  new Padding(padding: new EdgeInsets.all(10.0),),

                  new Text('What season brings snow?',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //correct answer
                      new Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        activeColor: Colors.lightBlueAccent,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Winter',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        activeColor: Colors.yellow,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Summer',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _radioValue1,
                        activeColor: Colors.deepOrangeAccent,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Fall',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),

//Question 2-------------------------------------------------------------------
                  new Padding(padding: new EdgeInsets.all(10.0),),

                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        new Text(
                          'Which season changes the color of leaves?',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Radio(
                              value: 0,
                              groupValue: _radioValue2,
                              activeColor: Colors.lightBlueAccent,
                              onChanged: _handleRadioValueChange2,
                            ),
                            new Text(
                              'Winter',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _radioValue2,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: _handleRadioValueChange2,
                            ),
                            new Text(
                              'Fall',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 2,
                              groupValue: _radioValue2,
                              activeColor: Colors.pinkAccent,
                              onChanged: _handleRadioValueChange2,
                            ),
                            new Text(
                              'Spring',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),

//Question 3-------------------------------------------------------------------
                        new Padding(padding: new EdgeInsets.all(10.0),),

                        new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                'Which season brings hot weather?',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio(
                                    value: 0,
                                    groupValue: _radioValue3,
                                    activeColor: Colors.deepOrangeAccent,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  new Text(
                                    'Fall',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                  new Radio(
                                    value: 1,
                                    groupValue: _radioValue3,
                                    activeColor: Colors.yellow,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  new Text(
                                    'Summer',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                  new Radio(
                                    value: 2,
                                    groupValue: _radioValue3,
                                    activeColor: Colors.pinkAccent,
                                    onChanged: _handleRadioValueChange3,
                                  ),
                                  new Text(
                                    'Spring',
                                    style: new TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),

//question 4-------------------------------------------------------------------
                              new Padding(padding: new EdgeInsets.all(10.0),),

                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    'Which season is Easter in?',
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Radio(
                                        value: 0,
                                        groupValue: _radioValue4,
                                        activeColor: Colors.pinkAccent,
                                        onChanged: _handleRadioValueChange4,
                                      ),
                                      new Text(
                                        'Spring',
                                        style:
                                        new TextStyle(fontSize: 16.0),
                                      ),
                                      new Radio(
                                        value: 1,
                                        groupValue: _radioValue4,
                                        activeColor: Colors.yellow,
                                        onChanged: _handleRadioValueChange4,
                                      ),
                                      new Text(
                                        'Summer',
                                        style:
                                        new TextStyle(fontSize: 16.0),
                                      ),
                                      new Radio(
                                        value: 2,
                                        groupValue: _radioValue4,
                                        activeColor: Colors.deepOrangeAccent,
                                        onChanged: _handleRadioValueChange4,
                                      ),
                                      new Text(
                                        'Fall',
                                        style:
                                        new TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
//question 5----------------------------------------------------------------------
                                  new Padding(padding: new EdgeInsets.all(10.0),),

                                  new Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'Which season is Halloween in?',
                                        style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Radio(
                                            value: 0,
                                            groupValue: _radioValue5,
                                            activeColor: Colors.yellow,
                                            onChanged:
                                            _handleRadioValueChange5,
                                          ),
                                          new Text(
                                            'Summer',
                                            style: new TextStyle(
                                                fontSize: 16.0),
                                          ),
                                          new Radio(
                                            value: 1,
                                            groupValue: _radioValue5,
                                            activeColor: Colors.pinkAccent,
                                            onChanged:
                                            _handleRadioValueChange5,
                                          ),
                                          new Text(
                                            'Spring',
                                            style: new TextStyle(
                                                fontSize: 16.0),
                                          ),
                                          new Radio(
                                            value: 2,
                                            groupValue: _radioValue5,
                                            activeColor: Colors.deepOrangeAccent,
                                            onChanged:
                                            _handleRadioValueChange5,
                                          ),
                                          new Text(
                                            'Fall',
                                            style: new TextStyle(
                                                fontSize: 16.0),
                                          ),
                                        ],
                                      ),

                                      new Padding(padding: new EdgeInsets.all(10.0),),

//buttons-----------------------------------------------------------------------
                                      new RaisedButton(

                                        onPressed: validateAnswers,
                                        child: new Text(
                                          'Check Your Score',
                                          style: new TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                        color: Theme.of(context).accentColor,

                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                20.0)),
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.all(4.0),
                                      ),
                                      //----------------------------------------------
                                      new RaisedButton(
                                        onPressed: resetSelection,
                                        child: new Text(
                                          'Reset Answers',
                                          style: new TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                        color: Theme.of(context).accentColor,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                20.0)
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ])
                      ])
                ])));
  }

  void resetSelection() {
    _handleRadioValueChange1(-1);
    _handleRadioValueChange2(-1);
    _handleRadioValueChange3(-1);
    _handleRadioValueChange4(-1);
    _handleRadioValueChange5(-1);
    correctScore = 0;
  }

  void validateAnswers() {
    if (_radioValue1 == -1 && _radioValue2 == -1 &&
        _radioValue3 == -1 && _radioValue4 == -1 &&
        _radioValue5 == -1) {
      Fluttertoast.showToast(msg: 'Please select at least one answer',
          toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg: 'Your total score is: $correctScore out of 5',
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
