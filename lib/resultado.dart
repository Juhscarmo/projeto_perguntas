import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get msgResult {
    return 'Concluído! Você acertou $pontuacao de 3.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
              child: Text(
                msgResult,
                style: TextStyle(fontSize: 25),
                ),
            ),
            TextButton(
              onPressed: reiniciarQuestionario, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: const Text(
                'Reiniciar?',
                style: TextStyle(fontSize: 18),
                ),
              )
      ],
    );
  }
}