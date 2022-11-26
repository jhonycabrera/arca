import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PanoramaPage extends StatefulWidget {
  String image;
   PanoramaPage({required this.image}) ;

  @override
  State<PanoramaPage> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends State<PanoramaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Panorama(
              animSpeed: 1.0,
              child: Image.network(widget.image, fit: BoxFit.cover,),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                     Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
