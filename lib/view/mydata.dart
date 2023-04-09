import 'package:flutter/material.dart';
import 'package:tabar/model/pessoa_model.dart';

class MyData extends StatelessWidget {
  const MyData({super.key});

  static const routeName = '/user';
  
  @override
  Widget build(BuildContext context) {
    // TODO: colocar imagem como primeiro elemento
    final dados = ModalRoute.of(context)!.settings.arguments as Pessoa;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 300,
            child: Image.network('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80')),
          Text(dados.nome),
          Text(dados.email)
        ],),
      ),
    );
  }
  
}