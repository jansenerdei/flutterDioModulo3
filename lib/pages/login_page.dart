import 'package:flutter/material.dart';
//import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/main_page.dart';
//import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),

                  //*********** IMAGEM ***************/
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 4,
                          child: Image.network(
                              'https://hermes.digitalinnovation.one/assets/diome/logo.png')),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /********** TEXTOS INICIAIS ************/
                  const Text("Já tem cadastro?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  /********** EMAIL ************/
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      child: TextField(
                        controller: emailController,
                        onChanged: (value) {},
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 119, 29, 194))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 119, 29, 194))),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 119, 29, 194),
                            )),
                      )),
                  const SizedBox(
                    height: 15,
                  ),

                  /********** SENHA ************/
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    child: TextField(
                      obscureText: isObscureText,
                      controller: senhaController,
                      onChanged: (value) {},
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 119, 29, 194))),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 119, 29, 194))),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: "Senha:",
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 119, 29, 194),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 119, 29, 194),
                              // ************** Forma de fazer ocultar senha com InkWell *********
                              /*suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 119, 29, 194),*/
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  /********** BOTÃO ************/
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailController.text.trim() == "" &&
                                senhaController.text.trim() == "") {
                              /*ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Login com sucesso!")));
                              debugPrint("Login com sucesso!");*/
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Erro ao efetuar login!")));
                              debugPrint("Erro ao efetuar um login!");
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 119, 29, 194)),
                          ),
                          child: const Text("ENTRAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),

                  /********** RODAPÉ ************/
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    child: const Text(
                      "Esqueci minha senha.",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    child: const Text("Criar conta.",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
