
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MainMenu extends StatefulWidget {
MainMenu({Key? key,required this.title}) : super(key: key);

final String title;

@override
MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu>{

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget searchBar(){
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x80055475), Color(0x8002C39A)])),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          icon: Icon(Icons.menu),
        ),

        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz)
          ),
        ],
        centerTitle: false,
        // title: Text(
        //      "search",
        //       style: TextStyle(color: Colors.white),
        //       ),
        backgroundColor: Color(0xff108aa6),
            ),

      //Menu drawer izquierdo
      drawer: Theme(data: Theme.of(context).copyWith(
        canvasColor: Colors.blue.withOpacity(0.2),
      ),

        child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff055475), Color(0xff02C39A)],
                      ),
                    ),
                child: Row(
                  children: <Widget>[
                  Text(
                    'OFER',
                    style: GoogleFonts.oswald(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffecf19e),
                    ),
                    textAlign: TextAlign.center,
                  ),
                    Text(
                      'PLUS',
                      style: GoogleFonts.oswald(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                ),

                ListTile(
                  title: Text('Suscripciones', style: TextStyle(color: Colors.white, fontSize: 20),),

                ),
                ListTile(
                  title: Text('Ofertas', style: TextStyle(color: Colors.white, fontSize: 20),),

                ),


              ],
            )
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        // child: Image.asset("assets/images/background.png"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Container(
                  width: 300,
                  height: 200,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    // border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'OFERTAS',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),

            ],
        ),
      ),

    );



  }


}