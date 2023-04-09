import 'package:flutter/material.dart';
import 'package:tabar/model/pessoa_model.dart';

import 'mydata.dart';

class Rainy extends StatefulWidget {
  const Rainy({super.key});

  @override
  State<Rainy> createState() => _RainyState();
}

class _RainyState extends State<Rainy> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
    // TODO: colocar imagem como primeiro elemento

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Image.network('https://images.unsplash.com/photo-1544502062-f82887f03d1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=959&q=80'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              label: Text('Nome'),
              border: OutlineInputBorder()
              ),
              onSubmitted: (text){
                _nameController.text = text;
              },
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text('Email'),
              border: OutlineInputBorder()
              ),
              onSubmitted: (text){
                _emailController.text = text;
              },
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(
                context, MyData.routeName, 
                arguments: Pessoa(_nameController.text, _emailController.text));
            }, 
            child: const Text('Salvar'))
        ],
      ),),
    );
  }
}