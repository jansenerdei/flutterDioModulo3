import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
/******* USER ACCOUNT *******/
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Camera"),
                            leading: const Icon(Icons.camera)),
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: const Text("Galeria"),
                            leading: const Icon(Icons.album))
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://avatars.githubusercontent.com/u/115055477?v=4"),
                ),
                accountName: const Text("Jansen Erdei"),
                accountEmail: const Text("jansenerdei@email.com")),
          ),

/******* DADOS CADSTRAIS *******/
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("Dados Cadastrais"),
                    ],
                  )),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),

/******* TERMOS DE USO *******/
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text("Termos de Uso e Privacidade"),
                    ],
                  )),
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula tincidunt, blandit dolor nec, ullamcorper eros. Nunc pharetra pulvinar elementum. Pellentesque lobortis ut augue eu ullamcorper. Suspendisse potenti. Suspendisse commodo elit nibh, a consectetur justo feugiat in. Nulla eget quam varius, viverra nisl vitae, ullamcorper velit. Quisque placerat porta ex, et efficitur magna ornare nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget magna semper ipsum sollicitudin venenatis eu vel lorem. Etiam ornare rutrum porta. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus tristique venenatis eros, eu vulputate velit luctus ac. Nulla non dolor nibh. Maecenas semper pulvinar urna id sodales. Ut scelerisque turpis nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean pulvinar metus vel dolor scelerisque volutpat. Nullam augue turpis, vulputate id massa eu, dignissim gravida mi. Aenean vestibulum feugiat urna. Cras in turpis eu eros pharetra vestibulum sed nec lectus. Morbi ut maximus quam, vitae feugiat risus. Praesent pharetra, diam vitae scelerisque facilisis, magna sapien eleifend sem, sit amet posuere nisl velit vel dui. Vivamus porttitor eros non luctus auctor. Morbi in mi vel ipsum suscipit imperdiet nec ac sem. Pellentesque non mauris aliquet, suscipit dui in, venenatis velit. Maecenas scelerisque egestas risus non feugiat. Praesent venenatis porta leo at pulvinar. Vivamus erat metus, malesuada at posuere ac, pellentesque sed lectus.",
                            style: TextStyle(fontSize: 16)));
                  });
            },
          ),

/******* CONFIGURAÇÕES *******/
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.album),
                      SizedBox(width: 5),
                      Text("Configurações"),
                    ],
                  )),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),

/******* SAIR *******/
          const Divider(),
          const SizedBox(height: 10),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5),
                      Text("Sair"),
                    ],
                  )),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    /******* ALERT DIALOG ********/
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text("Meu App"),
                      content: const Wrap(children: [
                        Text("deseja realmente sair do App?"),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim"))
                      ],
                    );
                  });
            },
          ),

/******* LAST DIVIDER  *******/
          const Divider(),
        ],
      ),
    );
  }
}
