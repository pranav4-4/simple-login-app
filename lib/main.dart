import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return new MaterialApp(
       home: new LoginPage(),
       theme: new ThemeData(
         primarySwatch: Colors.blue
       )
     );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}
class LoginPageState extends State<LoginPage>with SingleTickerProviderStateMixin{
  AnimationController _iconAni;
  Animation<double> _iconAnim;

  @override
  void initState(){
    super.initState();
    _iconAni =new AnimationController(
        vsync: this,
      duration: new Duration(milliseconds: 600)
    );
    _iconAnim = new CurvedAnimation(
        parent: _iconAni,
        curve: Curves.easeInCirc
    );
    _iconAnim.addListener(()=> this.setState((){}));
    _iconAni.forward();
  }
  String mytext="hello";

  void _changeText(){
    setState(() {
      if(mytext.startsWith("h"))
        mytext="Hello my best friend :)";
      else
        mytext="hello";
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Image(
            image: new AssetImage("assets/boy.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new FlutterLogo(
                size: _iconAnim.value *100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0
                        )
                      )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(50.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email",
                        ),
                        keyboardType: TextInputType.emailAddress ,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text ,
                      ),
                      new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                      ),

                      new Text(mytext, style: new TextStyle(
                        color: Colors.redAccent,
                          fontSize: 21.0
                      ),),

                      new MaterialButton(
                        height: 50.0,
                        minWidth: 65.0,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Icon(Icons.arrow_right_alt_outlined),
                        onPressed: _changeText,
                        splashColor: Colors.redAccent,
                      )
                    ],

              ),
                  ),
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}