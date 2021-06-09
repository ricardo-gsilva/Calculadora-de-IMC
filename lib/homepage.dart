import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoControl = TextEditingController();
  TextEditingController alturaControl = TextEditingController();

  String _dados = "Informe os dados";

  void reset() {
    pesoControl.text = "";
    alturaControl.text = "";
    setState(() {
      _dados = "Informe os dados";
    });
  }

  void calcular() {
    setState(() {
      double altura = double.parse(alturaControl.text) / 100;
      double peso = double.parse(pesoControl.text);
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _dados =
            "Abaixo do peso!" + "\n" + " IMC = ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _dados = "Peso ideal!" + "\n" + " IMC = ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _dados = "Pouco acima do peso!" +
            "\n" +
            " IMC = ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _dados =
            "Obesidade Grau I!" + "\n" + " IMC = ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _dados =
            "Obesidade Grau II!" + "\n" + "IMC = ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 40) {
        _dados = "Obesidade Grau III!" +
            "\n" +
            " IMC = ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Calculadora de IMC", style: TextStyle(fontSize: 30),),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  reset();
                },
              )
            ],
            backgroundColor: Colors.red,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                      
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Icon(
                          Icons.person_pin,
                          size: 150,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                          child: Text(
                            'Digite sua altura: ',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .2,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: alturaControl,
                              style: TextStyle(fontSize: 25),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                          child: Text(
                            'cm',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                          child: Text(
                            'Digite seu peso: ',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .2,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: pesoControl,
                              style: TextStyle(fontSize: 25),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SizedBox(
                          child: Text(
                            'Kg',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 25, left: 20, right: 20, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: 180,
                          child: ElevatedButton.icon(
                            onPressed: calcular,
                            icon: Icon(
                              Icons.calculate_sharp,
                              size: 45,
                              color: Colors.red.shade200,
                            ),
                            label: Text(
                              'Calcular',
                              style: TextStyle(fontSize: 23),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 30),
                    child: SizedBox(
                      child: Text(
                        _dados,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
