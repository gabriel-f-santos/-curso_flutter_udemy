import 'package:flutter/material.dart';
import 'dart:math';


void main(){
  //função principal para criar um app flutter
  // materialApp vem do material design
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false, //mostra ou não uma faixa de debug no app
  ));
  }


class Home extends StatefulWidget {//Define que a home vai ter um estado que pode ser modificado
//ou seja, seu valor pode ser alterado
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

//array de frases
var _frases = [
    "É apenas depois de perder tudo que somos livres para fazer qualquer coisa.",
    "Não deveríamos estar buscando heróis, deveríamos estar buscando boas ideias.",
    "Não se pode controlar o próprio povo pela força, mas se pode distrai-lo com consumismo.",
    "Quando estiver em busca de mudança, mude.",
    "As coisas que você possui acabam possuindo você."
  ];
  // variável que vai ser alterada para exibir frase na tabeça
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  //  método que não tem retorno (void) que seleciona uma frase aleatória do array
  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é uma estrutura para construção básica de um layout.
    return Scaffold(
      appBar: AppBar(//- É a barra superior do App
        title: Text("Frase do dia"),
        backgroundColor: Color.fromARGB(255, 66, 2, 41),
      ),
      //Corpo do app
      body: Container(//Cria uma caixa e ocupa o espaço do componente dentro dessa grande "caixa", é um wrapper
        padding: EdgeInsets.all(16),// espaço dentro do container..
        color: Color.fromARGB(255, 66, 2, 41),
        width: double.infinity, // como se fosse width 100%, ocupa toda área da tela disponível
        child: Column(//Alinha os componentes dentro da coluna
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//gerou espaço entre os componentes filhos
          crossAxisAlignment: CrossAxisAlignment.center,//centraliza os componentes filhos
          children: [
            Image.asset("imagens/logo-frases-do-dia.png"), 
            Text(_fraseGerada,
            textAlign: TextAlign.justify,//Alinhamento do texto.
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Color.fromARGB(255, 255, 255, 255)
            ),),
            ElevatedButton(onPressed: _gerarFrase,
                child: Text("Gerar novamente"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(58, 95, 0, 0),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
