import 'package:flutter/material.dart';

class Sunny extends StatefulWidget {
  const Sunny({super.key});


  @override
  State<Sunny> createState() => _SunnyState();
}

class _SunnyState extends State<Sunny> {
  
  // TODO: Validar valores de entrada para não permitir valores vazios
  // TODO: Validar valores para não permitir valores não numéricos
  final TextEditingController _controllerGasolina = TextEditingController();
  final TextEditingController _controllerAlcool = TextEditingController();

  String _resultado = 'Porcentagem do valor da gasolina: 0%';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Calculadora de combustível',
          style: TextStyle(color: Colors.green,
          fontSize: 25,
          ),
        ),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network('https://images.unsplash.com/photo-1604282742204-1e7bb6ffbd9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            ),
            const Text(
              'Gasolina vs Alcool',
              style: TextStyle(fontSize: 24),
              ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Valor',
                  label: Text('Gasolina'),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _controllerGasolina,
                onSubmitted: (text) {
                  _controllerGasolina.text = text;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Valor',
                    label: Text('Alcool'),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _controllerAlcool,
                  onSubmitted: (text) {
                    _controllerAlcool.text = text;
                  },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                double valorGas = double.parse(_controllerGasolina.text);
                double valorAlc = double.parse(_controllerAlcool.text);
                double valor = (valorAlc/valorGas) * 100;
                int result = valor.toInt();
                setState(() {
                  if(valor >= 71){
                    _resultado =  'Porcentagem do valor da gasolina: $result%\n'
                                  'Abasteça com gasolina';
                  } else{
                    _resultado =  'Porcentagem do valor da gasolina: $result%\n'
                                  'Abasteça com alcool';
                  }
                  
                });
              }, 
              child: const Text('Calcular')
            ),
            const SizedBox(
              height: 20,
            ),
            Text(_resultado,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.indigo
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}