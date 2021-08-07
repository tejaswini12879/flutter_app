import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';
import 'Screen2.dart';
import 'Screen3.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home), onPressed: () {  },),),
            Expanded(child: IconButton(icon: SvgPicture.asset("images/add_to_cart.svg"), onPressed: () { runApp(Screen2()); },),),
            Expanded(child: IconButton(icon: Image.asset("images/h.png"), onPressed: () { runApp(Screen3()); },),),
            Expanded(child: IconButton(icon: Icon(Icons.settings), onPressed: () {  },),),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Bigster', style: TextStyle(
          fontSize: 24,
          fontFamily: 'Yankee',
          fontWeight: FontWeight.bold),
      ),
      //backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("images/image2vector.svg", colorBlendMode: BlendMode.clear,),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
              "images/search.svg"
            // By default our  icon color is white

          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

}
