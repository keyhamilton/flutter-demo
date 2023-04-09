import 'package:flutter/material.dart';

class Cloudy extends StatefulWidget {
  const Cloudy({super.key});

  @override
  State<Cloudy> createState() => _CloudyState();

}

class _CloudyState extends State<Cloudy> {
  
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();

  String result = 'Informe seu dados';

  String imcMessage(String imc){
    String mystr = '';
    double estado = double.parse(imc);
      
    if(estado < 18.5){
      mystr = 'MAGREZA';
    }else if(estado > 18.5 && estado < 24.9){
      mystr = 'NORMAL';
    }else if(estado > 24.9 && estado < 29.9){
      mystr = 'SOBREPESO';
    }else if(estado > 24.9 && estado < 39.9){
      mystr = 'OBESIDADE';
    }else{
      mystr = 'OBESIDADE GRAVE';
    }

    return mystr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.green,
            onPressed: (){
              setState(() {
                result = 'Informe seu dados';
                _alturaController.text = '';
                _pesoController.text = '';
              });
            }, 
            icon: Icon(Icons.refresh),
            )
        ],
        title: Text('Calculadora de IMC'),
      ),
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,),
            TextField(
              controller: _pesoController,
              onSubmitted: (value) {
                _pesoController.text = value;
              },
              decoration: InputDecoration(
                labelText: 'Peso(Kg)',
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
              keyboardType: TextInputType.number,

            ),
            TextField(
              controller: _alturaController,
              onSubmitted: (value) {
                _alturaController.text = value;
              },
              decoration: InputDecoration(
                labelText: 'Altura(cm)',
                labelStyle: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),
            SizedBox(height: 10,),

            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  double resultado = double.parse(_pesoController.text)/((double.parse(_alturaController.text)/100)*(double.parse(_alturaController.text)/100));
                  String imc = resultado.toStringAsFixed(2);
                  setState(() {
                    result = 'IMC: $imc\n'
                             '${imcMessage(imc)}';
                  });
                }, 
                child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 25),
                  )
                ),
            ),
            Text(
              result,
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),

          ],
        ),
      ),
      
    );
  }
}