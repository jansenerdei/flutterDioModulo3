import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var linguagemRepository = LinguagemRepository();
  var linguagens = [];
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0.0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Dados Cadastrais")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
/******* NOME *************/
                    const TextLabel(texto: "Nome:"),
                    TextField(
                      controller: nomeController,
                    ),

/******* DATA DE NASCIMENTO *************/
                    const TextLabel(texto: "Data de Nascimento:"),
                    TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2001, 1, 1),
                            firstDate: DateTime(1900, 5, 20),
                            lastDate: DateTime(2023, 12, 31));
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dataNascimento = data;
                        }
                      },
                    ),

/******* NIVEIS DE EXPERIENCIA *************/
                    const TextLabel(texto: "Niveis de Experiência:"),
                    Column(
                        children: niveis
                            .map((nivel) => RadioListTile(
                                title: Text(nivel.toString()),
                                selected: nivelSelecionado == nivel.toString(),
                                value: nivel,
                                groupValue: nivelSelecionado,
                                onChanged: (value) {
                                  debugPrint(value);
                                  setState(() {
                                    nivelSelecionado = value.toString();
                                  });
                                }))
                            .toList()),

/*******  LINGUAGENS PREFERIDAS *************/
                    const TextLabel(texto: "Linguagens Preferidas:"),
                    Column(
                        children: linguagens
                            .map((linguagem) => CheckboxListTile(
                                title: Text(linguagem),
                                value:
                                    linguagensSelecionadas.contains(linguagem),
                                onChanged: (bool? value) {
                                  if (value!) {
                                    setState(() {
                                      linguagensSelecionadas.add(linguagem);
                                    });
                                  } else {
                                    setState(() {
                                      linguagensSelecionadas.remove(linguagem);
                                    });
                                  }
                                }))
                            .toList()),

/*******  TEMPO DE EXPERIÊNCIA *************/
                    const TextLabel(texto: "Tempo de experiência:"),
                    DropdownButton(
                        value: tempoExperiencia,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: ((value) {
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        })),

/*******  PRETENSÃO SALARIAL *************/
                    TextLabel(
                        texto:
                            "Pretensão Salarial: R\$ ${salarioEscolhido.round().toString()}"),
                    Slider(
                        min: 0.0,
                        max: 10000.0,
                        value: salarioEscolhido,
                        onChanged: (double value) {
                          setState(() {
                            salarioEscolhido = value;
                          });
                        }),

/******* BOTÃO SALVAR *************/
                    TextButton(
                        onPressed: () {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nome deve ser preenchido.")));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A data de nascimento deve ser preenchida.")));
                            return;
                          }
                          if (nivelSelecionado.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nivel deve ser selecionado.")));
                            return;
                          }
                          if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A linguagem deve ser selecionado.")));
                            return;
                          }
                          if (tempoExperiencia == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve haver ao menos 1 ano de experiência.")));
                            return;
                          }
                          if (salarioEscolhido == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Pretensão salarial deve ser maior que 0!")));
                            return;
                          }
                          debugPrint("Dados salvos com sucesso!");
                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              salvando = false;
                            });
                          });
                        },
                        child: const Text("Salvar"))
                  ],
                ),
        ));
  }
}
