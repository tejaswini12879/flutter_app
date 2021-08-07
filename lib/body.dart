import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String imagePath = 'images/';

  final CarouselController _controller = CarouselController();

  int _current = 0;

  final List<String> images = [
    'images/bag-1.png',
    'images/bag-2.png',
    'images/bag-3.png',
    'images/furniture-1.png',
    'images/furniture-2.png',
    'images/furniture-3.png',
    'images/elec-1.png',
    'images/elec-2.png',
    'images/elec-3.png',
  ];

  final List<String> places = [
    ' '' '' ''Blue'' ''Leather'' ''Bag',
    ' '' '' ''Brown'' ''Sling'' ''Bag',
    ' '' '' ''Brick'' ''red'' ''travel'' ''Bag',
    ' '' ''Teak'' ''Wood'' ''Sofa'' ''set',
    ' '' '' '' ''Elegant'' ''Couch',
    ' '' '' ''Soft'' ''double'' ''bed',
    ' '' '' ''Android'' ''smart'' ''phone',
    ' '' '' '' ''Alexa',
    ' '' '' '' ''Bluetooth'' ''Remote',
  ];
  final List<String> kind =[
    ' '' ' ' ''Women'' ''Shopping',
    ' '' ' ' ''Women'' ''Shopping',
    ' '' ' ' ''Women'' ''Shopping',
    ' '' ''Furniture',
    ' '' ''Furniture',
    ' '' ''Furniture',
    ' '' ''Electronics',
    ' '' ''Electronics',
    ' '' ''Electronics',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          element,
          fit: BoxFit.cover,
        ),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Container(
        padding: const EdgeInsets.only(top:100, left:20, right:20),
        

        child: Stack(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  height: 450.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 18/8,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;

                    });
                  }),
              carouselController: _controller,

            ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                child: Text(
                    kind[_current],
                    style: TextStyle(
                      letterSpacing: 0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Morgan',
                      fontSize: screenSize.width / 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(child: Text('')),
                Expanded(child:Text('')),
                Expanded(child:(Text(''))),
                Expanded(
                  child:Text(
                places[_current],
                style: TextStyle(
                letterSpacing: 0,
                decoration: TextDecoration.none,
                fontFamily: 'Amano',
                fontSize: screenSize.width / 15,
                color: Colors.black,
                ),
                ),
                ),
                ],
               ),
      ],
        ),
              );


  }
}