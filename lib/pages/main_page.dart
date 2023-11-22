import 'package:flutter/material.dart';
//import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/list_view_page.dart';
import 'package:trilhaapp/pages/tarefas_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /**** APP BAR *****/
        appBar: AppBar(title: const Text("Main Page")),
        drawer: const CustomDrawer(),

        /**** BODY *****/
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  //scrollDirection: Axis.vertical,
                  children: const [
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewPage(),
                    ListVewHorizontal(),
                    TarefaPage()
                  ]),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "CardPage", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Page2", icon: Icon(Icons.car_crash)),
                  BottomNavigationBarItem(
                      label: "Page3", icon: Icon(Icons.plus_one_rounded)),
                  BottomNavigationBarItem(
                      label: "Page4", icon: Icon(Icons.list)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.task)),
                ])
          ],
        ),
      ),
    );
  }
}
