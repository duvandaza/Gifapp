import 'package:flutter/material.dart';
import 'package:gifapp/models/gif_model.dart';

class CardGif extends StatelessWidget {
  const CardGif({
    Key? key,
    required this.size,
    required this.gif,
  }) : super(key: key);

  final Size size;
  final Datum gif;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, 5),
          )
        ],
        color: Colors.white54
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(26), topRight:Radius.circular(26)),
            child: SizedBox(
              height: size.height * 0.28,
              width: double.infinity,
              child: (gif.images != null) 
              ? FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage(gif.images),
                fit: BoxFit.cover,
              )
              : const Image(image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gif.title, 
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1, 
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}