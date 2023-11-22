import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuario 3"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Disponível"),
              Text("8:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "Opcao1",
                  child: Text("Opção1"),
                ),
                const PopupMenuItem<String>(
                  value: "Opcao2",
                  child: Text("Opção2"),
                ),
                const PopupMenuItem<String>(
                  value: "Opcao3",
                  child: Text("Opção3"),
                ),
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user1)
      ],
    );
  }
}
