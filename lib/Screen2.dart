import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import'Screen3.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),

    );
  }
}

  class Home extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
  return Scaffold(
    backgroundColor: Colors.white,
  body:Center(

             child: Column(
               //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Padding(padding: EdgeInsets.all(15.0),child: IconButton(icon: SvgPicture.asset("images/back.svg"), onPressed: () { runApp(MyApp()); },),),
              Padding(padding:EdgeInsets.all(10.0),child: Text("Furniture", style: TextStyle(
          letterSpacing: 0,
          decoration: TextDecoration.none,
          fontFamily: 'Morgan',
          fontSize: screenSize.width / 10,
          color: Colors.black,
        ),)),
              Padding(padding:EdgeInsets.only(top:5.0,bottom:5.0,left:15.0,right:15.0),child: Image.network(
                    "https://i.imgur.com/rGz4W1Z.png",height:300),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5.0),child:Text("Roman Living Hastings 3+1+1 Seater Fabric Sofa Pack (Brown)\n Material: Fabric\n Colour :	Brown\n Frame Material:	Wood\n Price: 10000 INR \n Cushion Style:	Boxed Edge\n Product Dimensions:187.96 x 78.74 x 81.28 cm;\n Leg Length:3 Inches \n ",style: TextStyle(fontFamily: 'Amano'),)),
                Padding(padding: EdgeInsets.only(top:10.0),child: Slide())],
          ),
        ),
            /*Expanded(child: Text("Good bye world! \n hey!",style: TextStyle(
              letterSpacing: 0,
              decoration: TextDecoration.none,
              fontFamily: 'Electrolize',
              fontSize: screenSize.width / 25,
              color: Colors.black,
            ),)),*/

    bottomNavigationBar: BottomAppBar(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: IconButton(icon: Icon(Icons.home), onPressed: () { runApp(MyApp()); },),),
          Expanded(child: IconButton(icon: SvgPicture.asset("images/add_to_cart.svg"), onPressed: () {  },),),
          Expanded(child: IconButton(icon: Image.asset("images/h.png"), onPressed: () { runApp(Screen3()); },),),
          Expanded(child: IconButton(icon: Icon(Icons.settings), onPressed: () {  },),),
        ],
      ),
    ),

        );
  }
}
class Slide extends StatefulWidget {
  @override
  _SlideState createState() => _SlideState();
}
class _SlideState extends State<Slide>  {

    // TODO: implement createState
    final CarouselController _controller = CarouselController();
    final List<String> images = [

      'images/furniture-1.png',
      'images/furniture-2.png',
      'images/furniture-3.png',

    ];
    List<Widget> generateImageTiles(screenSize) {
      return images
          .map(
            (element) => ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
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
    child: CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
        height: 110.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 18/8,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
    viewportFraction: 0.8,
    ),
    carouselController: _controller,

    ),
    );
  }


  }

