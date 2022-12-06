import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_app_bar.dart';
import 'package:rede_social_lr/Components/comp_post.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ComponentAppBar(),
        body: ComponentPost(
          postDescription: "Mostra sua força Brasil",
          postUsername: "TylerJoseph",
          postNickname: "@scaledandicy",
          postImage: const [
            "https://www.letras.com.br/storage/artista/0/0/1/001.jpg",
            "https://rollingstone.uol.com.br/media/_versions/twenty-one-pilots-6-melhores-covers-divulgacao_widelg.jpg",
            "https://blognroll.com.br/wp-content/uploads/2017/05/ba071a6f-1350-4ad3-8bd6-6a96b383c9fe.jpg",
            "https://www.radiorock.com.br/wp-content/uploads/2022/01/twenty-one-pilots-1.jpg"
          ],
        ),
      ),
    );
  }
}
