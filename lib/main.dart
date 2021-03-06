// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cliente/src/loginForm.dart';
import 'package:cliente/src/registrarForm.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart';



void main() {//async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'OfferPlus Clientes',
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

        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1)),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

//Scheme de colores: https://coolors.co/05668d-028090-00a896-02c39a-f0f3bd
class MyHomePageState extends State<MyHomePage> {

  //Segmento: titulo de la pagina
  Widget titulo() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'OFER',
          style: GoogleFonts.oswald(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Color(0xffecf19e),

            // color: Color(0xffE56B6F),
          ),
          children: [
            TextSpan(
              text: 'PLUS',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ]),
    );
  }



  //Segmento: Boton para ir a la pagina de login
  Widget loginFormBoton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginForm(title: '')));
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xff355070)),
        ),
      ),
    );
  }

  //Segmento: Boton para ir a la pagina de registro
  Widget registrarFormBoton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegistrarForm(title: '')));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Registrar',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }


  // Widget testFirebase() {
  //   return InkWell(
  //         onTap: () => FirebaseFirestore.instance.collection('testing')
  //             .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
  //
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           Text('Regresar',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //       // body: StreamBuilder(),
  //     );
  // }
  //construcci??n de la clase
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,

          //background color
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
                  colors: [Color(0xff055475), Color(0xff02C39A)])),

          //centrado de los segmentos de la pagina
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titulo(),
              SizedBox(
                height: 80,
              ),
              loginFormBoton(),
              SizedBox(
                height: 20,
              ),
              registrarFormBoton(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
  }

