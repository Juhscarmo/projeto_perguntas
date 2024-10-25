import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

void main(List<String> args) {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'De quem é a famosa frase "Penso, logo existo"?',
      'resposta': [
        {'texto': 'Platão', 'pontuacao': 0},
        {'texto': 'Descartes', 'pontuacao': 1},
        {'texto': 'Sócrates', 'pontuacao': 0},
        {'texto': 'Francis Bacon', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'De onde é a invenção do chuveiro elétrico?',
      'resposta': [
        {'texto': 'França', 'pontuacao': 0},
        {'texto': 'Inglaterra', 'pontuacao': 0},
        {'texto': 'Brasil', 'pontuacao': 1},
        {'texto': 'Itália', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o menor e o maior país do mundo?',
      'resposta': [
        {'texto': 'Vaticano e Rússia', 'pontuacao': 1},
        {'texto': 'Nauru e China', 'pontuacao': 0},
        {'texto': 'Mônaco e Canadá', 'pontuacao': 0},
        {'texto': 'Malta e Estados Unidos', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Quiz'),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
