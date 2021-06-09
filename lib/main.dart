import 'package:flutter/material.dart';
import 'package:nova_calc_imc/homepage.dart';

void main() {
  runApp(SplashScreen());
}

class Screen extends StatefulWidget {  
  @override
  _ScreenState createState() => _ScreenState();

}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class _ScreenState extends State<Screen> {  
  @override
  void initState(){
    super.initState();
    splashscreen();
  }

  void splashscreen(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage())
      );
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image(
            image: AssetImage('images/splash_screen/fundoscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *.5,
                child: Image(
                  image: AssetImage('images/splash_screen/medidor.png'),                  
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.7,
                child: Image(
                  image: AssetImage('images/splash_screen/logosplash.png'),
                ),
              ),
            ],
          ),
        ),
      ],      
    );
  }
}