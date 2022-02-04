import 'package:flutter/material.dart';
import 'package:quizapp_estrutura_inicial/perguntas.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> marcadorDePontos = List.empty();

  List<Pergunta> perguntas = [
    Pergunta(
      q: 'O metrô é um dos meios de transporte mais seguros do mundo',
      r: true,
    ),
    Pergunta(
      q: 'A culinária brasileira é uma das melhores do mundo.',
      r: true,
    ),
    Pergunta(
      q: 'Vacas podem voar, assim como peixes utilizam os pés para andar.',
      r: true,
    ),
  ];

  int numeroDaQuestaoAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                perguntas[numeroDaQuestaoAtual].questao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool respostaCorreta =
                    perguntas[numeroDaQuestaoAtual].respostaDaQuestao;

                if (respostaCorreta) {
                  print("usuário acertou");
                } else {
                  print("Usuário errou");
                }

                setState(() {
                  numeroDaQuestaoAtual++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Colors.grey.shade800),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool respostaCorreta =
                    perguntas[numeroDaQuestaoAtual].respostaDaQuestao;

                if (!respostaCorreta) {
                  print("usuário acertou");
                } else {
                  print("Usuário errou");
                }

                setState(() {
                  numeroDaQuestaoAtual++;
                });
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}
