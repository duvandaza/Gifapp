import 'package:flutter/material.dart';
import 'package:gifapp/services/gifs_service.dart';
import 'package:gifapp/widgets/cardgif_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final gifsService = Provider.of<GifsService>(context);
    final gif = gifsService.gif;

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Gifs App'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80
          ),
          itemCount: gif.length,
          itemBuilder: (BuildContext context, int i) {
            return CardGif(size: size, gif: gif[i]);
          },
        ),
      )
    );
  }
}

